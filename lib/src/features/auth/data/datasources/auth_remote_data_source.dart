import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/data/models/local_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<LocalUserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String fullName,
    required String password,
  });

  Future<void> forgetPassword(String email);

  Future<void> updateUser({
    required UpdateUserAction action,
    dynamic userData,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required FirebaseAuth authClient,
    required FirebaseFirestore cloudStoreClient,
    required FirebaseStorage dbClient,
  })  : _authClient = authClient,
        _cloudStoreClient = cloudStoreClient,
        _dbClient = dbClient;

  final FirebaseAuth _authClient;
  final FirebaseFirestore _cloudStoreClient;
  final FirebaseStorage _dbClient;

  @override
  Future<void> forgetPassword(String email) async {
    try {
      await _authClient.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      throw ServerException(
        message: e.message ??
            'An error occurred during ' 'forgot-password requested',
        statusCode: e.code,
      );
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        message: 'Unexpected error occurred during sign-in',
        statusCode: 'unexpected_error',
      );
    }
  }

  @override
  Future<LocalUserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _authClient.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user == null) {
        throw const ServerException(
          message:
              'An error occurred during sign-in ' 'Please try again please!',
          statusCode: 'EMPTY_USER',
        );
      }
      // Fetch user data from Firestore based on user.uid
      var userData = await _getUserData(user.uid);

      // Check if the data is exits,
      // otherwise create new collection in firebase
      if (userData.exists) {
        return LocalUserModel.fromMap(userData.data()!);
      }

      // Convert into model
      await _setUserData(user, email);
      userData = await _getUserData(user.uid);
      return LocalUserModel.fromMap(userData.data()!);
    } on FirebaseException catch (e) {
      throw ServerException(
        message: e.message ?? 'An error occurred during sign-in',
        statusCode: e.code,
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      // TODO(Implement-Logging): add logger to log this
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.runtimeType == Exception
            ? e.toString()
            : 'Unexpected error occurred during sign-in',
        statusCode: 'unexpected_error',
      );
    }
  }

  @override
  Future<void> signUp({
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      final userCredential = await _authClient.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      await user?.updateDisplayName(fullName);
      await user?.updatePhotoURL(kDefaultAvatar);
      await _setUserData(_authClient.currentUser!, email);
    } on FirebaseException catch (e) {
      throw ServerException(
        message: e.message ?? 'An error occurred during sign-up',
        statusCode: e.code,
      );
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        message: 'Unexpected error occurred during sign-up',
        statusCode: 'unexpected_error',
      );
    }
  }

  @override
  Future<void> updateUser({
    required UpdateUserAction action,
    dynamic userData,
  }) async {
    try {
      final currentUser = _authClient.currentUser;
      switch (action) {
        case UpdateUserAction.email:
          await currentUser?.updateEmail(userData as String);
          await _updateUserData({'email': userData});
        case UpdateUserAction.displayName:
          await currentUser?.updateDisplayName(userData as String);
          await _updateUserData({'fullName': userData});
        case UpdateUserAction.profilePic:
          final ref = _dbClient
              .ref()
              .child('profile_pics/${_authClient.currentUser?.uid}');
          await ref.putFile(userData as File);
          final photoURL = await ref.getDownloadURL();
          await currentUser?.updatePhotoURL(photoURL);
          await _updateUserData({'profilePic': photoURL});
        case UpdateUserAction.password:
          if (_authClient.currentUser == null) {
            throw const ServerException(
              message: 'User does not exit!',
              statusCode: 'Insufficent Permission',
            );
          }
          final newData = jsonDecode(userData as String) as DataMap;
          await currentUser?.reauthenticateWithCredential(
            EmailAuthProvider.credential(
              email: _authClient.currentUser!.email!,
              password: newData['oldPassword'] as String,
            ),
          );
          await currentUser?.updatePassword(newData['newPassword'] as String);
        case UpdateUserAction.bio:
          await _updateUserData({'bio': userData});
      }
    } on FirebaseException catch (e) {
      throw ServerException(message: e.message!, statusCode: e.code);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.runtimeType == Exception
            ? e.toString()
            : 'Unexpected error occurred during sign-in',
        statusCode: 'unexpected_error',
      );
    }
  }

  Future<DocumentSnapshot<DataMap>> _getUserData(String uid) async {
    return _cloudStoreClient.collection('users').doc(uid).get();
  }

  Future<void> _setUserData(User user, String fallbackEmail) async {
    await _cloudStoreClient.collection('users').doc(user.uid).set(
          LocalUserModel(
            uid: user.uid,
            email: user.email ?? fallbackEmail,
            points: 0,
            fullName: user.displayName ?? '',
            profilePic: user.photoURL ?? '',
          ).toMap(),
        );
  }

  Future<void> _updateUserData(DataMap data) => _cloudStoreClient
      .collection('users')
      .doc(_authClient.currentUser?.uid)
      .update(data);
}
