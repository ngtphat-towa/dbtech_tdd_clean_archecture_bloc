import 'package:dbtech_tdd_clean_archecture_bloc/resources/colors.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/resources/fonts.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/routes/router.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/services/injection_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: '/',
    );
  }
}
