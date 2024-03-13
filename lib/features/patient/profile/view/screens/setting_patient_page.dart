import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:gradution_project/features/patient/profile/view_model/setting_patient/setting_patient_bloc.dart';

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
          child: SingleChildScrollView(
        child: Column(
          children: [
            10.he(),
            Card(
              elevation: 0,
              color: AppColors.whiteColor,
              child: Container(
                margin: EdgeInsets.all(15.w),
                width: double.infinity,
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
                    BlocBuilder<SettingPatientBloc, SettingPatientState>(
                      builder: (context, state) {
                        SettingPatientBloc instance =
                            BlocProvider.of<SettingPatientBloc>(context);
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
                                    color: instance.arabicValue ==
                                            instance.currentLang
                                        ? AppColors.scColor
                                        : AppColors.hintColor,
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w600,
                                  ),
                                  activeColor: AppColors.scColor,
                                  value: instance.arabicValue,
                                  groupValue: instance.currentLang,
                                  onChanged: (value) {
                                    instance.changeLang('ar');
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: appText(
                                    align: TextAlign.start,
                                    txt: 'English',
                                    color: instance.englishValue ==
                                            instance.currentLang
                                        ? AppColors.scColor
                                        : AppColors.hintColor,
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w600,
                                  ),
                                  activeColor: AppColors.scColor,
                                  value: instance.englishValue,
                                  groupValue: instance.currentLang,
                                  onChanged: (value) {
                                    instance.changeLang('en');
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    10.he(),
                  ],
                ),
              ),
            ),
            20.he(),
            Card(
              elevation: 0,
              color: AppColors.whiteColor,
              child: Container(
                margin: EdgeInsets.all(15.w),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: appText(
                          txt: 'Enable Notifications:',
                          size: AppConstants.largeText,
                          fw: FontWeight.w700,
                        ),
                      ),
                    ),
                    BlocBuilder<SettingPatientBloc, SettingPatientState>(
                      builder: (context, state) {
                        SettingPatientBloc instance =
                            BlocProvider.of<SettingPatientBloc>(context);
                        return SizedBox(
                            height: 50.h,
                            child: Switch(
                              activeColor: AppColors.scColor,
                              activeTrackColor:
                                  AppColors.hintColor.withOpacity(0.2),
                              value: instance.switchValue,
                              onChanged: (value) {
                                instance.changeSwitch(value);
                              },
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ),
            20.he(),
            Card(
              elevation: 0,
              color: AppColors.whiteColor,
              child: Container(
                margin: EdgeInsets.all(15.w),
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: appText(
                        txt: 'Change Password:',
                        size: AppConstants.largeText,
                        fw: FontWeight.w700,
                        color: AppColors.redColor,
                      ),
                    ),
                    BlocBuilder<SettingPatientBloc, SettingPatientState>(
                      builder: (context, state) {
                        SettingPatientBloc instance =
                            BlocProvider.of<SettingPatientBloc>(context);
                        return Form(
                          key: BlocProvider.of<SettingPatientBloc>(context).key,
                          child: Column(
                            children: [
                              10.he(),
                              MyCustomTextField(
                                controller: instance.currentPassword,
                                bcolor: AppColors.hintColor.withOpacity(0.6),
                                validator: FormBuilderValidators.required(),
                                hint: 'Current Password',
                                width: 250.w,
                                isTextObscured:
                                    instance.isCurrentPasswordShowing,
                                icon: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                      instance
                                          .changeLoginPasswordSuffixIcon(true);
                                    },
                                    icon: Icon(
                                      instance.suffixIconCurrent,
                                      color: AppColors.scColor,
                                    )),
                              ),
                              10.he(),
                              MyCustomTextField(
                                controller: instance.newPassword,
                                bcolor: AppColors.hintColor.withOpacity(0.6),
                                validator: FormBuilderValidators.required(),
                                hint: 'New Password',
                                width: 250.w,
                                isTextObscured: instance.isNewPasswordShowing,
                                icon: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                      instance
                                          .changeLoginPasswordSuffixIcon(false);
                                    },
                                    icon: Icon(
                                      instance.suffixIconNew,
                                      color: AppColors.scColor,
                                    )),
                              ),
                              10.he(),
                              MyCustomTextField(
                                controller: instance.newPassword,
                                bcolor: AppColors.hintColor.withOpacity(0.6),
                                validator: FormBuilderValidators.required(),
                                hint: 'Confirm New Password',
                                width: 250.w,
                                isTextObscured: instance.isNewPasswordShowing,
                              ),
                              20.he(),
                              AppButton(
                                color: AppColors.redColor,
                                w: 220.w,
                                txt: 'Change Password',
                                onTap: () {
                                  if (BlocProvider.of<SettingPatientBloc>(
                                          context)
                                      .key
                                      .currentState!
                                      .validate()) {}
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            20.he(),
          ],
        ),
      )),
    );
  }
}
