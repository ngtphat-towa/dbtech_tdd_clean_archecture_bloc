import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});
  String get errorMessage => '$statusCode'
      'Error: $message';
  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure(
    super.message, {
    super.statusCode,
  });
  ServerFailure.fromException(ServerException exception)
      : super(
          exception.message,
          statusCode: exception.statusCode,
        );
}

class CacheFailure extends Failure {
  final CacheException exception;

  CacheFailure(this.exception) : super(exception.message);
}

class ConnectionFailure extends Failure {
  final ConnectionException exception;

  ConnectionFailure(this.exception) : super(exception.toString());
}
