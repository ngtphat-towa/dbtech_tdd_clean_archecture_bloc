import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/typedef.dart';

abstract class OnBoardingRepository {
  const OnBoardingRepository();
  ResultVoid cacheFirstTimer();
  ResultPredicate checkIfUserIsFirstTime();
}
