import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_project/features/doctor/home/view/widgets/home_body.dart';
import 'package:gradution_project/features/doctor/home/view/widgets/home_bottom_nav.dart';
import 'package:gradution_project/features/doctor/home/view_model/cubit/home_cubit.dart';

class DoctorBottomNav extends StatelessWidget {
  const DoctorBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDoctorCubit, int>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: HomeDoctorBody(
            index: state,
          ),
          bottomNavigationBar: AppDoctorBottomNavBar(
            state: state,
          ),
        );
      },
    );
  }
}
