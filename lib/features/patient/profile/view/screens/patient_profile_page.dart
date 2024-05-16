// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/images/profile_image.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';

class ProfilePatientPage extends StatelessWidget {
  const ProfilePatientPage({super.key, required this.wi});
  final bool? wi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        color: AppColors.scColor,
        tcolor: AppColors.whiteColor,
        // title: 'Profile',
        wi: wi,
        icolor: wi == false ? AppColors.whiteColor : AppColors.redColor,
      ),
      body: Background(
        pad: 0,
        child: Column(
          children: [
            Container(
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                color: AppColors.scColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 150.h,
                    width: 150.w,
                    child: const CustomAvatarImage(),
                  ),
                  appText(
                    txt: 'Noha Ali',
                    size: AppConstants.largeText,
                    color: AppColors.whiteColor,
                    fw: FontWeight.w600,
                  )
                ],
              ),
            ),
            25.he(),
            Expanded(
              child: ListView.builder(
                itemCount: profileData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(12.w),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              profileData[index]['Color'] != AppColors.redColor
                                  ? AppColors.scColor
                                  : AppColors.redColor,
                          radius: 20.r,
                          child: Icon(
                            profileData[index]['icon'],
                            color: AppColors.whiteColor,
                            size: AppConstants.extraText + 5,
                          ),
                        ),
                        14.wd(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                                txt: profileData[index]['title'],
                                size: AppConstants.mediumText,
                                fw: FontWeight.w600,
                                color: profileData[index]['Color'] !=
                                        AppColors.redColor
                                    ? AppColors.fontColor
                                    : AppColors.redColor),
                            SizedBox(
                              width: 200.w,
                              child: appText(
                                align: TextAlign.start,
                                txt: profileData[index]['subtitle'],
                                size: AppConstants.verySmallText,
                                of: TextOverflow.ellipsis,
                                fw: FontWeight.w500,
                                color: profileData[index]['Color'] !=
                                        AppColors.redColor
                                    ? AppColors.hintColor
                                    : AppColors.redColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            if (profileData[index]['Color'] !=
                                AppColors.redColor) {
                              navigate(
                                  context: context,
                                  route: profileData[index]['Routes']);
                            } else {
                              showAdaptiveDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.whiteColor,
                                    elevation: 0,
                                    content: appText(
                                      txt:
                                          'Are you sure to Logout?  Don\'t be shy!',
                                      size: AppConstants.largeText,
                                      fw: FontWeight.w500,
                                      color: AppColors.hintColor,
                                    ),
                                    title: Icon(
                                      Icons.login_outlined,
                                      color: AppColors.redColor,
                                      size: AppConstants.ultraText + 30.w,
                                    ),
                                    actions: [
                                      AppButton(
                                        color: AppColors.scColor,
                                        txt: 'Logout',
                                        onTap: () async {
                                          await sl<CacheHelper>().clearData();

                                          navigatePop(context: context);
                                          navigateReplaceAll(
                                              context: context,
                                              route: Routes.getStartedPage);
                                        },
                                      ),
                                      AppButton(
                                        color: AppColors.scColor,
                                        border: true,
                                        txt: 'Close',
                                        onTap: () {
                                          navigatePop(context: context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                              print('Logout');
                            }
                          },
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            size: AppConstants.ultraText + 5,
                            color: profileData[index]['Color'] !=
                                    AppColors.redColor
                                ? AppColors.scColor
                                : AppColors.redColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map> profileData = [
  {
    'title': 'Personal Information',
    'subtitle': 'email, phone number, address, birth date, gender',
    'icon': Icons.mark_email_read_rounded,
    'Routes': Routes.personalInfoPatient,
    'Color': AppColors.scColor,
  },
  {
    'title': 'Settings',
    'subtitle': 'langueges, Notifications,Change Pasword',
    'icon': Icons.settings_suggest_rounded,
    'Color': AppColors.scColor,
    'Routes': Routes.settingsPatient,
  },
  {
    'title': 'ID Information',
    'subtitle': 'Id, Medical Records',
    'icon': Icons.assignment_ind_rounded,
    'Color': AppColors.scColor,
    'Routes': Routes.idInfoPage,
  },
  {
    'title': 'Logout',
    'subtitle': 'Sign out of your account',
    'icon': Icons.logout_rounded,
    'Color': AppColors.redColor,
    'Routes': Routes.patientInfo,
  },
];
