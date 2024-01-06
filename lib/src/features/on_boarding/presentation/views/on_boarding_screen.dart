import 'package:dbtech_tdd_clean_archecture_bloc/src/core/commons/commons.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const routeName = '/';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<OnBoardingCubit>().loadOnBoardingStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GradientBackground(
        image: MediaRes.onBoardingBackground,
        child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {
            if (state is OnBoardingStatus && !state.isFirstTimer) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is UserCached) {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
          builder: (context, state) {
            if (state is CheckingIfUserIsFirstTimer ||
                state is CachingFirstTimer) {
              return const LoadingView();
            }
            return Stack(
              children: [
                PageView(
                  controller: pageController,
                  children: [
                    const OnBoardingSplashArt(
                      pageContent: PageContent.first(),
                    ),
                    const OnBoardingSplashArt(
                      pageContent: PageContent.second(),
                    ),
                    const OnBoardingSplashArt(
                      pageContent: PageContent.third(),
                    ),
                    Align(
                      alignment: const Alignment(0, 24),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        onDotClicked: (index) {
                          pageController.animateToPage(
                            index,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        effect: const WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 40,
                          activeDotColor: Colours.primaryColour,
                          dotColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
