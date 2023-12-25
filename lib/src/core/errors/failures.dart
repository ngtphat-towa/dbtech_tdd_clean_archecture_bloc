import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverFailure(
    ServerException exception,
  ) = ServerFailure;
  const factory Failure.cacheFailure(
    CacheException exception,
  ) = CacheFailure;
  const factory Failure.connectionFailure(
    ConnectionException exception,
  ) = ConnectionFailure;

}
