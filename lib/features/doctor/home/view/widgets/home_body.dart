import 'package:flutter/material.dart';
import 'package:gradution_project/core/constants/app_colors.dart';

import 'package:gradution_project/features/doctor/home_page/view/screens/home_page.dart';

class HomeDoctorBody extends StatelessWidget {
  HomeDoctorBody({
    super.key,
    required this.index,
  });
  final int index;
  final List<Widget> pages = [
    const DoctorHomePage(),
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
