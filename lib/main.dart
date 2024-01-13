import 'package:dbtech_tdd_clean_archecture_bloc/firebase_options.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/commons/app/providers/providers.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/commons/resources/colors.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/commons/resources/fonts.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/routes/router.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/services/injection_container.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/dashboard/dashboard.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  await initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalUserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Education App',
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colours.primaryColour,
          ),
          fontFamily: Fonts.poppins,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
        ),
        onGenerateRoute: generateRoute,
        // initialRoute: '/sign-in',
      ),
    );
  }
}
