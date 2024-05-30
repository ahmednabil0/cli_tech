import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/features/doctor/home/view_model/home_doctor/home_doctor_bloc.dart';
import 'package:gradution_project/features/doctor/patients_messages/view/screens/doctor_pateints_messages_screen.dart';
import 'package:gradution_project/features/patient/profile/view/screens/doctor_profile_page.dart';

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
    const DoctorPatientsMessage(),
    Container(
      color: AppColors.hintColor,
    ),
    const DoctorProfilePage(wi: true),
  ];
  @override
  Widget build(BuildContext context) {
    return pages[index];
  }
}
