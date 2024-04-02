import 'package:flutter/material.dart';
import 'package:gradution_project/core/constants/app_colors.dart';

class HomeDoctorBody extends StatelessWidget {
  HomeDoctorBody({
    super.key,
    required this.index,
  });
  final int index;
  final List<Widget> pages = [
    Container(
      color: AppColors.hintColor,
    ),
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
