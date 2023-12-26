import 'dart:convert';

import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/contants.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  Future<List<UserModel>> getUsers();
}

const kCreateUserEndpoint = '/users';
const kGetUsersEndpoint = '/users';

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final http.Client _client;

  AuthenticationRemoteDataSourceImpl(this._client);

  @override
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    // TODO: implement createUser
    // 1. check to make sure that it return the right data when
    // the repsonse code is 200 or the proper response code
    // 2. check if the  data when the remoteDataSource thows
    // an exception, then return a failure
    try {
      final response = await _client.post(
        Uri.parse('$kBaseUrl$kCreateUserEndpoint'),
        body: jsonEncode({
          'createdAt': createdAt,
          'name': name,
          'avatar': avatar,
        }),
      );

      if (response.statusCode == 201) {
        // Assuming 201 for successful creation
        // Handle successful response
      } else {
        // Handle error
        throw ServerException(
          response.body,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response =
          await _client.get(Uri.parse('$kBaseUrl$kGetUsersEndpoint'));

      if (response.statusCode == 200) {
        final usersJson = List<DataMap>.from(jsonDecode(response.body) as List);
        return usersJson.map((user) => UserModel.fromMap(user)).toList();
      } else {
        // Handle error
        throw ServerException(
          response.body,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), statusCode: 505);
    }
  }
}
