import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/features/doctor/home/view/screens/bottom_nav.dart';
import 'package:gradution_project/features/patient/home/view/screens/bottom_nav.dart';
import 'package:gradution_project/features/patient/pending/view/pending_screen.dart';

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
      nextScreen: getNextScreen(),
    );
  }
}

getNextScreen() {
  // print(sl<CacheHelper>().containsKey(key: 'uid'));
  // print(sl<CacheHelper>().getData(key: 'pending'));
  // print(sl<CacheHelper>().getData(key: 'role'));

  if (sl<CacheHelper>().containsKey(key: 'uid') &&
      sl<CacheHelper>().getData(key: 'role') == 'doctor') {
    return const DoctorBottomNav();
  } else if (sl<CacheHelper>().getData(key: 'role') == 'patient' &&
      sl<CacheHelper>().getData(key: 'pending') == false) {
    return const PatientBottomNav();
  } else if (sl<CacheHelper>().getData(key: 'role') == 'patient' &&
      sl<CacheHelper>().getData(key: 'pending') == true) {
    return const PendingPage(role: 'patient');
  } else {
    return GetStarted();
  }
}
