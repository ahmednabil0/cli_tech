import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/features/doctor/home/view_model/home_doctor/home_doctor_bloc.dart';

import '../screens/home_screen.dart';

class HomeDoctorBody extends StatelessWidget {
  HomeDoctorBody({
    super.key,
    required this.index,
  });
  final int index;
  final List<Widget> pages = [
    BlocProvider(
      create: (context) => sl<HomeDoctorBloc>()..getData(),
      child: const DoctorHomeScreen(),
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
