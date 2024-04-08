import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/static_data/doctor/doctor_home_data.dart';
import 'package:gradution_project/features/doctor/home/view/widgets/carousel_slider_home.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/db/cache/cache_helper.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/navigate.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/widgets/images/custom_image.dart';
import '../../../../../core/widgets/images/profile_image.dart';
import '../../../../../core/widgets/sized_box.dart';
import '../../../../../core/widgets/space.dart';
import '../../../../../core/widgets/text.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    int count = 10;
    Jiffy.setLocale('en_us');

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Background(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  txt: 'Hi, Dr.Marwan',
                  size: AppConstants.extraText,
                  fw: FontWeight.bold),
            ),
            HSizedBox(
              he: 25.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                appText(
                    txt: "Upcoming Schedule",
                    size: AppConstants.mediumText,
                    fw: FontWeight.w600),
                const WSizedBox(),
                CircleAvatar(
                  backgroundColor: AppColors.scColor,
                  radius: 13.r,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: appText(
                          txt: '$count',
                          size: AppConstants.mediumText,
                          color: AppColors.whiteColor,
                          fw: FontWeight.bold)),
                ),
                WSizedBox(
                  w: 60.w,
                ),
                TextButton(
                    onPressed: null,
                    child: appText(
                        txt: 'view All',
                        size: AppConstants.mediumText,
                        color: AppColors.scColor.withOpacity(0.8))),
              ],
            ),
            HSizedBox(
              he: 20.h,
            ),
            CarouselSliderHome(count: count),
            const HSizedBox(),
            Divider(
              color: AppColors.blackColor.withOpacity(0.2),
            ),
            const HSizedBox(),
            Expanded(
              child: GridView.builder(
                itemCount: doctorData.length,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => navigate(
                      context: context,
                      route: doctorData[index]['page'],
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
                              imgPath: doctorData[index]['image'],
                              // w: 50.w,
                              h: 25.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          appText(
                            ph: 5.h,
                            pw: 5.w,
                            txt: doctorData[index]
                                [sl<CacheHelper>().getCachedLanguage()],
                            size: AppConstants.verySmallText,
                            fw: FontWeight.bold,
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

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 90.w,
      toolbarHeight: 80.h,
      leading: CustomImage(
        h: 100.h,
        imgPath: AppConstants.appLogo,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SizedBox(
            width: 50,
            height: 50,
            child: InkWell(
                onTap: () {
                  navigate(
                    context: context,
                    route: Routes.doctorPrifilePage,
                    args: false,
                  );
                },
                child:
                    const CustomAvatarImage(image: AppConstants.doctorPImage)),
          ),
        ),
      ],
    );
  }
}
