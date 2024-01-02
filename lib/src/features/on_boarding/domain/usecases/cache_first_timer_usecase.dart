
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/usecases/usecases.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/typedef.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/repos/on_boarding_reopository.dart';

class CacheFirstTimer extends UsecaseWithoutParams<void> {
  CacheFirstTimer(this._repository);

  final OnBoardingRepository _repository;
  @override
  ResultFuture<void> call() async => _repository.cacheFirstTimer();
}
