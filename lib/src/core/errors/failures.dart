import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverFailure(
    String message,
    int statusCode,
  ) = ServerFailure;
  const factory Failure.cacheFailure(String errorMessage) = CacheFailure;
  const factory Failure.connectionFailure() = ConnectionFailure;
}
