import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/images/profile_image.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:gradution_project/features/patient/profile/view_model/PersonalInformation/personal_information_bloc.dart';

class PersonalInfoDoctorPage extends StatelessWidget {
  const PersonalInfoDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Personal Info',
      ),
      body: Background(
          child: BlocBuilder<PersonalInformationBloc, PersonalInformationState>(
        builder: (context, state) {
          var instance = BlocProvider.of<PersonalInformationBloc>(context);
          return Form(
            key: instance.formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Card(
                              shape: const CircleBorder(),
                              color: AppColors.whiteColor,
                              child: Container(
                                padding: EdgeInsets.all(15.w),
                                height: 150.h,
                                width: 150.w,
                                child: const CustomAvatarImage(),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Card(
                                    shape: const CircleBorder(),
                                    elevation: 0,
                                    color: AppColors.scColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.w),
                                      child: Icon(
                                        Icons.edit_rounded,
                                        color: AppColors.whiteColor,
                                        size: 25.w,
                                      ),
                                    )))
                          ],
                        ),
                        10.he(),
                        MyCustomTextField(
                          controller: instance.nameController,
                          lapel: instance.nameController.text.isEmpty
                              ? null
                              : instance.nameController.text,
                          hint: 'Your Name',
                          width: 290.w,
                        ),
                        10.he(),
                        MyCustomTextField(
                          controller: instance.emailController,
                          lapel: instance.emailController.text.isEmpty
                              ? null
                              : instance.emailController.text,
                          hint: 'Your Email',
                          width: 290.w,
                        ),
                        10.he(),
                        MyCustomTextField(
                          controller: instance.phoneController,
                          lapel: instance.phoneController.text.isEmpty
                              ? null
                              : instance.phoneController.text,
                          hint: 'Your Phone Number',
                          width: 290.w,
                        ),
                        10.he(),
                        MyCustomTextField(
                          controller: instance.addressController,
                          lapel: instance.addressController.text.isEmpty
                              ? null
                              : instance.addressController.text,
                          hint: 'Your Address',
                          width: 290.w,
                        ),
                        10.he(),
                        MyCustomTextField(
                          controller: instance.ageController,
                          lapel: instance.ageController.text.isEmpty
                              ? null
                              : instance.ageController.text,
                          hint: 'Your Age',
                          width: 290.w,
                        ),
                        10.he(),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: appText(
                            pw: 10.w,
                            txt: 'Gender: ',
                            size: AppConstants.largeText,
                            fw: FontWeight.w800,
                          ),
                        ),
                        BlocBuilder<PersonalInformationBloc,
                            PersonalInformationState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    BlocProvider.of<PersonalInformationBloc>(
                                            context)
                                        .changeGender('male');
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 45.w,
                                        color:
                                            BlocProvider.of<PersonalInformationBloc>(
                                                            context)
                                                        .currentGender ==
                                                    'male'
                                                ? AppColors.scColor
                                                : AppColors.hintColor
                                                    .withOpacity(0.5),
                                      ),
                                      appText(
                                        txt: 'Male',
                                        size: AppConstants.mediumText,
                                        fw: FontWeight.w700,
                                        color:
                                            BlocProvider.of<PersonalInformationBloc>(
                                                            context)
                                                        .currentGender ==
                                                    'male'
                                                ? AppColors.scColor
                                                : AppColors.hintColor
                                                    .withOpacity(0.5),
                                      )
                                    ],
                                  ),
                                ),
                                20.wd(),
                                InkWell(
                                  onTap: () {
                                    BlocProvider.of<PersonalInformationBloc>(
                                            context)
                                        .changeGender('female');
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.person_2_rounded,
                                        size: 45.w,
                                        color:
                                            BlocProvider.of<PersonalInformationBloc>(
                                                            context)
                                                        .currentGender ==
                                                    'female'
                                                ? AppColors.scColor
                                                : AppColors.hintColor
                                                    .withOpacity(0.5),
                                      ),
                                      appText(
                                        txt: 'Female',
                                        size: AppConstants.mediumText,
                                        fw: FontWeight.w700,
                                        color:
                                            BlocProvider.of<PersonalInformationBloc>(
                                                            context)
                                                        .currentGender ==
                                                    'female'
                                                ? AppColors.scColor
                                                : AppColors.hintColor
                                                    .withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                10.he(),
                AppButton(
                  w: 280.w,
                  loading:
                      state == const PersonalInformationState.dataLoading(),
                  txt: 'Save Information',
                  onTap: () async {
                    await instance.updateData();
                  },
                ),
                15.he(),
              ],
            ),
          );
        },
      )),
    );
  }
}
