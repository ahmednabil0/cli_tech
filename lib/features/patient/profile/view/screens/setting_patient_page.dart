import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/features/patient/profile/view_model/settings_patient/settings_patient_bloc.dart';

class SettingsPatientPage extends StatelessWidget {
  const SettingsPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Settings',
      ),
      body: Background(
          child: Column(
        children: [
          10.he(),
          Card(
            elevation: 0,
            color: AppColors.whiteColor,
            child: Container(
              margin: EdgeInsets.all(10.w),
              width: double.infinity,
              height: 100.h,
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: appText(
                      txt: 'Languages:',
                      size: AppConstants.largeText,
                      fw: FontWeight.w700,
                    ),
                  ),
                  BlocBuilder<SettingsPatientBloc, SettingsPatientState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 50.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: appText(
                                    txt: 'Arabic',
                                    align: TextAlign.start,
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w600),
                                activeColor: AppColors.scColor,
                                value: BlocProvider.of<SettingsPatientBloc>(
                                        context)
                                    .arabicValue,
                                groupValue:
                                    BlocProvider.of<SettingsPatientBloc>(
                                            context)
                                        .currentLang,
                                onChanged: (value) {
                                  BlocProvider.of<SettingsPatientBloc>(context)
                                      .changeLang('ar');
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: appText(
                                    align: TextAlign.start,
                                    txt: 'English',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w600),
                                activeColor: AppColors.scColor,
                                value: BlocProvider.of<SettingsPatientBloc>(
                                        context)
                                    .englishValue,
                                groupValue:
                                    BlocProvider.of<SettingsPatientBloc>(
                                            context)
                                        .currentLang,
                                onChanged: (value) {
                                  BlocProvider.of<SettingsPatientBloc>(context)
                                      .changeLang('en');
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
