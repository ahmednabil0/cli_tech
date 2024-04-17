import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/images/custom_image.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';

class PatientRecordsPage extends StatelessWidget {
  const PatientRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Omar Khaled',
      ),
      body: Background(
        child: Column(
          children: [
            15.he(),
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
                  width: 100.w,
                  height: 100.h,
                ),
                10.wd(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
            25.he(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: appText(
                txt: 'Patient Report',
                size: AppConstants.mediumText,
                fw: FontWeight.w700,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      AppConstants.bkImage,
                    ),
                    opacity: 0.3,
                    fit: BoxFit.cover),
                color: AppColors.scColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: AppColors.scColor,
                ),
              ),
              child: appText(
                align: TextAlign.start,
                txt:
                    'The patient complains of severe pain in the lower right abdomen, accompanied by high fever and nausea.',
                size: AppConstants.mediumText,
                ml: 5,
                of: TextOverflow.ellipsis,
                color: AppColors.scColor.withOpacity(0.7),
                fw: FontWeight.w500,
              ),
            ),
            15.he(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: appText(
                txt: 'Patient Records',
                size: AppConstants.mediumText,
                fw: FontWeight.w700,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 0.3,
                    borderOnForeground: true,
                    color: AppColors.whiteColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 8.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                ],
                              ),
                              CustomImage(
                                h: 50.h,
                                imgPath: AppConstants.preservation,
                              )
                            ],
                          ),
                          5.he(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.edit_document,
                                color: AppColors.primaryColor.withOpacity(0.7),
                                size: 20.w,
                              ),
                              4.wd(),
                              Expanded(
                                child: appText(
                                  txt:
                                      'Report: The patient complains of severe pain in the lower right abdomen, accompanied by high fever and nausea.',
                                  size: AppConstants.verySmallText,
                                  fw: FontWeight.w600,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.7),
                                  of: TextOverflow.ellipsis,
                                  ml: 3,
                                  align: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                          5.he(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppButton(
                                w: 120.w,
                                h: 30.h,
                                ts: AppConstants.nanoText + 1,
                                tfw: FontWeight.w800,
                                txt: 'View Details',
                                onTap: () {
                                  navigate(
                                    context: context,
                                    route: Routes.viewPatientMedicalRrcord,
                                  );
                                },
                              ),
                              AppButton(
                                w: 120.w,
                                h: 30.h,
                                border: true,
                                color: AppColors.primaryColor,
                                ts: AppConstants.nanoText + 1,
                                tfw: FontWeight.w800,
                                txt: 'Contact Doctor',
                                onTap: () {},
                              )
                            ],
                          ),
                          5.he(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
