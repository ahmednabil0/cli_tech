import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/images/custom_image.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:qr_flutter/qr_flutter.dart';

class IdInformationAndMedicalRecordsPatientPage extends StatelessWidget {
  const IdInformationAndMedicalRecordsPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Your Qr Code',
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
                height: 350.h,
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
                    15.he(),
                    Card(
                      color: AppColors.whiteColor,
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.all(4.0.w),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            QrImageView(
                              data: '1000000000002100',
                              version: 2,
                              size: 210.0.w,
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
                            Positioned(
                                child: SvgPicture.asset(
                              AppConstants.qr,
                            ))
                          ],
                        ),
                      ),
                    ),
                    15.he(),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  appText(
                    pw: 10.w,
                    txt: 'Medical Records',
                    size: AppConstants.largeText,
                    fw: FontWeight.w800,
                  ),
                  const Spacer(),
                  textButton(
                    txt: 'more...',
                    fw: FontWeight.w600,
                    color: AppColors.hintColor,
                    size: AppConstants.smallText,
                    onTap: () {},
                  ),
                  15.wd(),
                ],
              ),
              SizedBox(
                  height: 150.h,
                  child: Card(
                    margin: EdgeInsets.all(10.w),
                    elevation: 0,
                    color: AppColors.scColor.withOpacity(0.2),
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            margin: EdgeInsets.all(10.w),
                            elevation: 0.3,
                            borderOnForeground: true,
                            color: AppColors.whiteColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 8.h,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomImage(
                                    h: 50.h,
                                    imgPath: AppConstants.preservation,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                    ],
                                  ),
                                  5.he(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )),
              30.he(),
            ],
          )),
    );
  }
}
