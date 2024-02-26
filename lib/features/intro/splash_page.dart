import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_const.dart';
import 'get_started_pages.dart';

class SplasScreen extends StatelessWidget {
  const SplasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.background,
      splash: Image.asset(AppConstants.appLogo),
      splashIconSize: 1000,
      nextScreen: GetStarted(),
    );
  }
}
