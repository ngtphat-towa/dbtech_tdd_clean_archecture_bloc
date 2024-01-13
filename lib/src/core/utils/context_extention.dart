import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get mediaSize => mediaQuery.size;
  double get width => mediaSize.width;
  double get height => mediaSize.height;

  LocalUserProvider get userProvider => read<LocalUserProvider>();

  LocalUser? get currentUser => userProvider.user;

  TabNavigator get tagNavigator => read<TabNavigator>();

  void popTab() => tagNavigator.pop();
  void pushTab(Widget child) => tagNavigator.push(TabItem(child: child));
}
