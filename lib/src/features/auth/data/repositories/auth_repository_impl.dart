import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/exception.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/enum.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, void>> forgetPassword(String email) async {
    try {
      await _remoteDataSource.forgetPassword(email);
      return const Right(null); // Indicate success
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, LocalUser>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } on CacheException catch (e) {
      return Left(
        CacheFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      await _remoteDataSource.signUp(
        email: email,
        fullName: fullName,
        password: password,
      );
      return const Right(null); // Indicate success
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } on CacheException catch (e) {
      return Left(
        CacheFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateUser({
    required UpdateUserAction action,
    dynamic userData,
  }) async {
    try {
      await _remoteDataSource.updateUser(
        action: action,
        userData: userData,
      );
      return const Right(null); // Indicate success
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } on CacheException catch (e) {
      return Left(
        CacheFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
