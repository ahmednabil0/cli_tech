import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/static_data/patient/patients_home_data.dart';
import 'package:gradution_project/core/widgets/images/custom_image.dart';
import 'package:gradution_project/core/widgets/images/profile_image.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/space.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:jiffy/jiffy.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Background(
        child: Column(
          children: [
            HSizedBox(
              he: 20.h,
            ),
            InkWell(
              onTap: () {
                navigate(
                  context: context,
                  route: otherPatientData['page'],
                );
              },
              child: Container(
                height: 110.h,
                decoration: BoxDecoration(
                  color: AppColors.scColor,
                  borderRadius: BorderRadius.circular(
                    15.r,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.scColor,
                      AppColors.scColor.withOpacity(0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                color: AppColors.background,
                              )),
                          child: appText(
                            txt: Jiffy.now().yMEd,
                            size: AppConstants.largeText,
                            fw: FontWeight.w400,
                            color: AppColors.background,
                          ),
                        ),
                        appText(
                          pw: 12.w,
                          txt: otherPatientData[
                              sl<CacheHelper>().getCachedLanguage()],
                          size: AppConstants.largeText,
                          color: AppColors.whiteColor,
                          fw: FontWeight.w800,
                        ),
                        appText(
                          pw: 12.w,
                          txt: "Appointments : 45",
                          size: AppConstants.mediumText,
                          color: AppColors.background.withOpacity(0.7),
                          fw: FontWeight.w400,
                        ),
                        // appText(
                        //   pw: 12.w,
                        //   txt: 'Status: Opened',
                        //   size: AppConstants.mediumText,
                        //   color: AppColors.redColor.withOpacity(0.7),
                        //   fw: FontWeight.w600,
                        // ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      otherPatientData['image'],
                      height: 100.h,
                    )
                  ],
                ),
              ),
            ),
            HSizedBox(
              he: 35.h,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: appText(
                // pw: 5.w,
                txt: "Our Services: ",
                size: AppConstants.largeText,
                fw: FontWeight.w900,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: patientData.length,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => navigate(
                      context: context,
                      route: patientData[index]['page'],
                    ),
                    child: Card(
                      surfaceTintColor: AppColors.whiteColor,
                      color: AppColors.whiteColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.w),
                            child: CustomImage(
                              imgPath: patientData[index]['image'],
                              // w: 50.w,
                              h: 50.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          appText(
                            ph: 5.h,
                            pw: 5.w,
                            txt: patientData[index]
                                [sl<CacheHelper>().getCachedLanguage()],
                            size: AppConstants.verySmallText,
                            fw: FontWeight.w500,
                          )
                        ],
                      ),
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
