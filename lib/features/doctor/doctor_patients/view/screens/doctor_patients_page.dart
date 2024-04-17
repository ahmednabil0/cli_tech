import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';

class DoctorPatientsPage extends StatelessWidget {
  const DoctorPatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'Patients'),
      body: Background(
          child: Column(
        children: [
          MyCustomTextField(
            width: double.infinity,
            controller: TextEditingController(),
            hint: 'Search By Patient Name...',
            icon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                color: AppColors.scColor,
                size: AppConstants.extraText,
              ),
            ),
          ),
          15.he(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15.r,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              image: const DecorationImage(
                                  image: AssetImage(AppConstants.person),
                                  fit: BoxFit.cover),
                            ),
                            width: 60.w,
                            height: 60.h,
                          ),
                          10.wd(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText(
                                  txt: 'Name: Omar Khaled',
                                  size: AppConstants.largeText,
                                  fw: FontWeight.w700,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range_rounded,
                                      color: AppColors.hintColor,
                                    ),
                                    appText(
                                      txt: ' Age: 27',
                                      size: AppConstants.mediumText,
                                      color: AppColors.hintColor,
                                      fw: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_android_rounded,
                                      color: AppColors.hintColor,
                                    ),
                                    appText(
                                      txt: '01065255355',
                                      size: AppConstants.mediumText,
                                      color: AppColors.hintColor,
                                      fw: FontWeight.w600,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      10.he(),
                      appText(
                        align: TextAlign.start,
                        txt:
                            'Report:The patient complains of severe pain in the lower right abdomen, accompanied by high fever and nausea.',
                        size: AppConstants.smallText,
                        ml: 5,
                        of: TextOverflow.ellipsis,
                        color: AppColors.redColor.withOpacity(0.7),
                        fw: FontWeight.w400,
                      ),
                      5.he(),
                      AppButton(
                        txt: 'View Medical Rewcords',
                        onTap: () {
                          navigate(
                            context: context,
                            route: Routes.patientRecordsPage,
                          );
                        },
                        w: double.infinity,
                      )
                    ]),
                  ),
                );
              },
              separatorBuilder: (context, index) => 10.he(),
              itemCount: 10,
            ),
          )
        ],
      )),
    );
  }
}
