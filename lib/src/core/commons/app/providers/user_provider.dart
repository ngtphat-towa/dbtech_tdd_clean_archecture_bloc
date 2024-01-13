import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:flutter/cupertino.dart';

class LocalUserProvider extends ChangeNotifier {
  LocalUserModel? _user;

  LocalUserModel? get user => _user;

  void initUser(LocalUserModel? value) {
    if (_user != value) _user = value;
  }

  set user(LocalUserModel? value) {
    if (_user != value) _user = value;
    Future.delayed(Duration.zero, notifyListeners);
  }
}
