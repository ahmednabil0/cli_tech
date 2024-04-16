import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
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

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Background(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                appText(
                  txt: "Upcoming Schedule",
                  size: AppConstants.largeText,
                  fw: FontWeight.w600,
                ),
                8.wd(),
                CircleAvatar(
                  backgroundColor: AppColors.scColor,
                  radius: 14.r,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: appText(
                      txt: '10',
                      size: AppConstants.mediumText,
                      color: AppColors.whiteColor,
                      fw: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            HSizedBox(
              he: 20.h,
            ),
            const CarouselSliderHome(count: 10),
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
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 5.h,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => navigate(
                      context: context,
                      route: doctorData[index]['page'],
                    ),
                    child: Card(
                      color: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.r),
                        ),
                      ),
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.w),
                            child: CustomImage(
                              imgPath: doctorData[index]['image'],
                              // w: 50.w,
                              h: 35.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          appText(
                            ph: 5.h,
                            pw: 5.w,
                            txt: doctorData[index]
                                [sl<CacheHelper>().getCachedLanguage()],
                            size: AppConstants.mediumText,
                            fw: FontWeight.w700,
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
