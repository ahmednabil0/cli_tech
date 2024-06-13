import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/db/cache/cache_helper.dart';

class IdInformationAndMedicalRecordsPatientPage extends StatelessWidget {
  const IdInformationAndMedicalRecordsPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Your Qr Code',
        context: context,
        // color: AppColors.scColor.withOpacity(0.9),
        icolor: AppColors.fontColor,
        tcolor: AppColors.fontColor,
      ),
      body: Background(
          pad: 0,
          child: Container(
            margin: EdgeInsets.all(15.w),
            height: 300.h,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.scColor.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 15,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              gradient: const LinearGradient(
                colors: [AppColors.scColor, AppColors.primaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              color: AppColors.scColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(
                300.r,
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
                          data: sl<CacheHelper>().getData(key: 'uid'),
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
          )),
    );
  }
}
