import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PatientInfoPage extends StatelessWidget {
  const PatientInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: '',
        context: context,
        color: AppColors.scColor.withOpacity(0.9),
        icolor: AppColors.whiteColor,
        tcolor: AppColors.whiteColor,
      ),
      body: Background(
          pad: 0,
          child: Column(
            children: [
              Container(
                height: 230.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.scColor,
                    AppColors.scColor.withOpacity(0.9),
                    AppColors.scColor.withOpacity(0.8),
                    AppColors.scColor.withOpacity(0.73)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  color: AppColors.scColor.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appText(
                      txt: 'Set up your profile',
                      size: AppConstants.mediumText,
                      fw: FontWeight.w700,
                      color: AppColors.whiteColor,
                    ),
                    appText(
                      pw: 10.w,
                      txt:
                          'Update your profile to connect your doctor with better impression.',
                      size: AppConstants.verySmallText,
                      fw: FontWeight.w500,
                      color: AppColors.whiteColor.withOpacity(0.8),
                    ),
                    15.he(),
                    Card(
                      color: AppColors.whiteColor,
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.all(4.0.w),
                        child: QrImageView(
                          data: '1000000000002100',
                          version: 2,
                          size: 140.0.w,
                          // backgroundColor: AppColors.whiteColor,
                          dataModuleStyle: const QrDataModuleStyle(
                            color: AppColors.scColor,
                            dataModuleShape: QrDataModuleShape.circle,
                          ),
                          eyeStyle: const QrEyeStyle(
                            color: AppColors.scColor,
                            eyeShape: QrEyeShape.circle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              20.he(),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: appText(
                  pw: 10.w,
                  txt: 'Personal information',
                  size: AppConstants.largeText,
                  fw: FontWeight.w800,
                ),
              ),
              MyCustomTextField(
                width: 290.w,
                controller: TextEditingController(text: 'Ahmednabil'),
                ro: true,
                lapel: 'Name',
                color: AppColors.hintColor,
              ),
              15.he(),
              MyCustomTextField(
                width: 290.w,
                controller: TextEditingController(text: '01065028467'),
                ro: true,
                lapel: 'Phone Number',
                color: AppColors.hintColor,
              ),
              15.he(),
              MyCustomTextField(
                width: 290.w,
                ro: true,
                controller: TextEditingController(text: '2002/02/11'),
                lapel: 'Date Of Birth',
                color: AppColors.hintColor,
              ),
              20.he(),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: appText(
                  pw: 10.w,
                  txt: 'Gender: ',
                  size: AppConstants.largeText,
                  fw: FontWeight.w800,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 45.w,
                        color: AppColors.hintColor.withOpacity(0.5),
                      ),
                      appText(
                        txt: 'Male',
                        size: AppConstants.mediumText,
                        fw: FontWeight.w700,
                        color: AppColors.hintColor.withOpacity(0.5),
                      )
                    ],
                  ),
                  20.wd(),
                  Column(
                    children: [
                      Icon(
                        Icons.person_2_rounded,
                        size: 45.w,
                        color: AppColors.scColor,
                      ),
                      appText(
                        txt: 'Female',
                        size: AppConstants.mediumText,
                        fw: FontWeight.w700,
                        color: AppColors.scColor,
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              AppButton(w: 280.w, txt: 'Edit Information', onTap: () {}),
              10.he()
            ],
          )),
    );
  }
}
