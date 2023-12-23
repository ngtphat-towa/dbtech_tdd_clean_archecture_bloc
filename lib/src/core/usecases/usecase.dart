// [Future] UseCase
import 'package:dbtech_tdd_clean_archecture_bloc/src/src.dart';

abstract class UseCaseWithParams<T, Params> {
  ResultFuture<T> call(Params params);
}

// [Future] NoParamUseCase
abstract class UseCaseWithNoParams<T> {
  ResultFuture<T> call();
}

// [Streams] StreamUseCase
abstract class StreamUseCase<T, Params> {
  ResultStream<T> call(Params params);
}
