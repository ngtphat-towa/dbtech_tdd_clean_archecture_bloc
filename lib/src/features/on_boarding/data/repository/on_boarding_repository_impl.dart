import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/exception.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/typedef.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/data/datasources/on_boading_local_data_source.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/repos/on_boarding_reopository.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  const OnBoardingRepositoryImpl(this._localDataSource);

  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultVoid cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null); // Return a successful result
    } on CacheException catch (exception) {
      return Left(
        CacheFailure(
          message: exception.message,
          statusCode: exception.statusCode,
        ),
      );
    } catch (e) {
      return Left(
        CacheFailure(
          message: e.toString(),
          statusCode: 500,
        ),
      ); // Return a failure result
    }
  }

  @override
  ResultPredicate checkIfUserIsFirstTime() async {
    try {
      final isFirstTime = await _localDataSource.checkIfUserIsFirstTimer();
      return Right(isFirstTime); // Return whether the user is first time
    } on CacheException catch (exception) {
      return Left(
        CacheFailure(
          message: exception.message,
          statusCode: exception.statusCode,
        ),
      );
    } catch (e) {
      return Left(
        CacheFailure(
          message: e.toString(),
          statusCode: 500,
        ),
      ); // Return a failure result
    }
  }
}
