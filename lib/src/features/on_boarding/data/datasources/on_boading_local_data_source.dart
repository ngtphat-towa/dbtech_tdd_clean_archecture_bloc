import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  Future<void> cacheFirstTimer();
  Future<bool> checkIfUserIsFirstTimer();
}

class OnBoardingLocalDataSourceImpl implements OnBoardingLocalDataSource {
  OnBoardingLocalDataSourceImpl(this.sharedPreferences);
  static const String firstTimerKey = 'first-timer-key';

  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await sharedPreferences.setBool(firstTimerKey, true);
    } catch (e) {
      throw CacheException(message: 'Error caching first timer: $e');
    }
  }

  @override
  Future<bool> checkIfUserIsFirstTimer() async {
    try {
      final isFirstTime = sharedPreferences.getBool(firstTimerKey) ?? true;
      return isFirstTime;
    } catch (e) {
      throw CacheException(message: 'Error checking user status: $e');
    }
  }
}
