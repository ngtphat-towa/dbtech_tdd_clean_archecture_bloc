import 'package:dbtech_tdd_clean_archecture_bloc/src/core/commons/resources/images.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/commons/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        image: MediaRes.onBoardingBackground,
        child: Center(
          child: Lottie.asset(MediaRes.pageUnderConstruction),
        ),
      ),
    );
  }
}
