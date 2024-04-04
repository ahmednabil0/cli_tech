import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/static_data/bottom_nav_bar_data/data.dart';
import 'package:gradution_project/features/doctor/home/view_model/cubit/home_cubit.dart';

class AppDoctorBottomNavBar extends StatelessWidget {
  const AppDoctorBottomNavBar({
    super.key,
    required this.state,
  });
  final int state;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(
          50.r,
        ),
      ),
      child: GNav(
        rippleColor: AppColors.hintColor.withOpacity(0.1),
        textStyle: TextStyle(
            fontFamily: AppConstants.fontFamily,
            fontSize: AppConstants.mediumText,
            color: AppColors.scColor,
            fontWeight: FontWeight.w500),
        mainAxisAlignment: MainAxisAlignment.center,
        haptic: false, // haptic feedback
        selectedIndex: state,
        onTabChange: (value) =>
            BlocProvider.of<HomeDoctorCubit>(context).changeIndex(value),
        tabBorderRadius: 25.r,
        tabActiveBorder: Border.all(
          color: AppColors.scColor,
          width: 0.5,
        ),
        color: AppColors.scColor.withOpacity(0.4),
        activeColor: AppColors.scColor,
        tabBackgroundColor: AppColors.scColor.withOpacity(0.1),
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 5.h,
        ),
        tabMargin: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 8.h,
        ),
        gap: 8.w,
        tabs: bottomNavBarPatientData
            .map((tap) => GButton(
                  icon: tap['icon'],
                  iconSize: 28.w,
                  iconActiveColor: AppColors.scColor,
                  text: tap[sl<CacheHelper>().getCachedLanguage()],
                ))
            .toList(),
      ),
    );
  }
}
