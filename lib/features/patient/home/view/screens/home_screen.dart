import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/static_data/patient/patients_home_data.dart';
import 'package:gradution_project/core/widgets/images/custom_image.dart';
import 'package:gradution_project/core/widgets/images/profile_image.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/space.dart';
import 'package:gradution_project/core/widgets/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HSizedBox(
                he: 30.h,
              ),
              SizedBox(
                height: 305.h,
                child: GridView.builder(
                  itemCount: patientData.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppColors.whiteColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.w),
                            child: CustomImage(
                              imgPath: patientData[index]['image'],
                              // w: 50.w,
                              h: 70.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          appText(
                            ph: 5.h,
                            pw: 5.w,
                            txt: patientData[index]
                                [sl<CacheHelper>().getCachedLanguage()],
                            size: AppConstants.smallText,
                            fw: FontWeight.w600,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              HSizedBox(
                he: 15.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: appText(
                  ph: 5.h,
                  pw: 5.w,
                  // align: TextAlign.start,
                  txt: "Others: ",
                  size: AppConstants.ultraText,
                  fw: FontWeight.w600,
                ),
              ),
              HSizedBox(
                he: 5.h,
              ),
              SizedBox(
                height: 150.h,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: otherPatientData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          shape: const CircleBorder(),
                          color: AppColors.whiteColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20.w),
                                child: CustomImage(
                                  imgPath: otherPatientData[index]['image'],
                                  // w: 50.w,
                                  h: 50.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        appText(
                          ph: 7.w,
                          pw: 15.w,
                          txt: otherPatientData[index]
                              [sl<CacheHelper>().getCachedLanguage()],
                          size: AppConstants.smallText,
                          fw: FontWeight.w600,
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Icon(
        Icons.menu_rounded,
        color: AppColors.scColor,
        size: 35.w,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: const SizedBox(
            width: 50,
            height: 50,
            child: CustomAvatarImage(),
          ),
        ),
      ],
    );
  }
}
