import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_project/features/patient/home/view/widgets/home_body.dart';
import 'package:gradution_project/features/patient/home/view/widgets/home_bottom_nav.dart';
import 'package:gradution_project/features/patient/home/view_model/cubit/home_cubit.dart';

class PatientBottomNav extends StatelessWidget {
  const PatientBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: HomePatientBody(
            index: state,
          ),
          bottomNavigationBar: AppPatientBottomNavBar(
            state: state,
          ),
        );
      },
    );
  }
}
