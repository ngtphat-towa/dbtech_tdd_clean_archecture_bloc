import 'package:dbtech_tdd_clean_archecture_bloc/src/core/usercases/usecases.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/typedef.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/repos/on_boarding_reopository.dart';

class CheckIfUserIsFirstTime extends UsecaseWithoutParams<bool> {
  CheckIfUserIsFirstTime(this._repository);

  final OnBoardingRepository _repository;
  @override
  ResultPredicate call() async => _repository.checkIfUserIsFirstTime();
}
