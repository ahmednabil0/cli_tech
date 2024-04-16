import 'package:flutter/material.dart';
import 'package:gradution_project/core/constants/app_colors.dart';

import 'package:gradution_project/features/doctor/appointments/view/screens/apointments_doctor_page.dart';

import '../screens/home_screen.dart';

class HomeDoctorBody extends StatelessWidget {
  HomeDoctorBody({
    super.key,
    required this.index,
  });
  final int index;
  final List<Widget> pages = [
    const DoctorHomeScreen(),
    Container(
      color: AppColors.scColor,
    ),
    Container(
      color: AppColors.primaryColor,
    ),
    Container(
      color: AppColors.hintColor,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return pages[index];
  }
}
