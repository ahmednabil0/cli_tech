import 'package:flutter/material.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/features/patient/home/view/screens/home_screen.dart';

class HomePatientBody extends StatelessWidget {
  HomePatientBody({
    super.key,
    required this.index,
  });
  final int index;
  final List<Widget> pages = [
    const HomePage(),
    Container(
      color: AppColors.scColor,
    ),
    Container(
      color: AppColors.primaryColor,
    ),
    Container(
      color: AppColors.redColor,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return pages[index];
  }
}
