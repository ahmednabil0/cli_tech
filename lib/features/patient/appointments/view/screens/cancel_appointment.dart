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

class CancelAppointMentPatient extends StatelessWidget {
  const CancelAppointMentPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Cancel Appointment', context: context),
      body: Background(
          child: Column(
        children: [
          15.he(),
          SizedBox(
            width: 310.w,
            child: MyCustomTextField(
              controller: TextEditingController(),
              hint: 'Search Here By Date',
              icon: Icon(
                Icons.date_range_rounded,
                color: AppColors.scColor,
                size: 25.w,
              ),
            ),
          ),
          25.he(),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: appText(
              txt: 'Recent:',
              size: AppConstants.largeText,
              fw: FontWeight.w600,
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Card(
                    elevation: 0,
                    borderOnForeground: true,
                    color: AppColors.whiteColor.withOpacity(0.7),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 8.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.format_list_numbered_rounded,
                                color: AppColors.scColor,
                                size: 20.w,
                              ),
                              4.wd(),
                              appText(
                                txt: 'Number: 15',
                                size: AppConstants.mediumText,
                                fw: FontWeight.w500,
                                color: AppColors.hintColor,
                              ),
                              const Spacer(),
                              appText(
                                txt: '[waiting: 14]',
                                size: AppConstants.mediumText - 0.5,
                                fw: FontWeight.w500,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.date_range_outlined,
                                color: AppColors.scColor,
                                size: 20.w,
                              ),
                              4.wd(),
                              appText(
                                txt: 'Date: 2024/03/3',
                                size: AppConstants.mediumText,
                                fw: FontWeight.w500,
                                color: AppColors.hintColor,
                              ),
                            ],
                          ),
                          2.he(),
                          Row(
                            children: [
                              Icon(
                                Icons.medical_information,
                                color: AppColors.scColor,
                                size: 20.w,
                              ),
                              4.wd(),
                              appText(
                                txt:
                                    'Type: ${index.isEven ? 'Exmanations' : 'Retry'}',
                                size: AppConstants.mediumText,
                                fw: FontWeight.w500,
                                color: AppColors.hintColor,
                              ),
                            ],
                          ),
                          2.he(),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                color: AppColors.scColor,
                                size: 20.w,
                              ),
                              4.wd(),
                              appText(
                                txt: '3.00 AM',
                                size: AppConstants.mediumText,
                                fw: FontWeight.w500,
                                color: AppColors.hintColor,
                              ),
                            ],
                          ),
                          5.he(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // AppButton(
                              //   h: 30.h,
                              //   w: 120.w,
                              //   color: AppColors.scColor.withOpacity(0.8),
                              //   txt: 'Update',
                              //   onTap: () {},
                              // ),
                              AppButton(
                                h: 30.h,
                                w: 250.w,
                                color: AppColors.redColor.withOpacity(0.85),
                                txt: 'Cancel',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      )),
    );
  }
}
