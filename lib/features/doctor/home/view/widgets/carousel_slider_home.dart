import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/extensions/gaps.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_const.dart';
import '../../../../../core/widgets/space.dart';
import '../../../../../core/widgets/text.dart';

class CarouselSliderHome extends StatelessWidget {
  const CarouselSliderHome({required this.count, super.key});
  final int count;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: count,
      itemBuilder: (context, index, realIndex) => InkWell(
        onTap: null,
        child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HSizedBox(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
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
                                5.he(),
                                appText(
                                    txt: 'Ali Ramadan',
                                    size: AppConstants.largeText,
                                    fw: FontWeight.bold),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                15.he(),
                                Container(
                                  height: 30.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 7.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10.r,
                                    ),
                                    color: AppColors.redColor.withOpacity(0.2),
                                  ),
                                  child: Center(
                                    child: appText(
                                      txt: '2024/4/5',
                                      size: AppConstants.mediumText,
                                      color: AppColors.fontColor,
                                      fw: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                5.he(),
                                Container(
                                  height: 30.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 7.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10.r,
                                    ),
                                    color:
                                        AppColors.primaryColor.withOpacity(0.2),
                                  ),
                                  child: Center(
                                    child: appText(
                                      txt: 'Examination',
                                      size: AppConstants.mediumText,
                                      color: AppColors.fontColor,
                                      fw: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      HSizedBox(
                        he: 20.h,
                      ),
                    ]),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.scColor.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.r),
                            bottomRight: Radius.circular(16.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          color: AppColors.whiteColor,
                        ),
                        const WSizedBox(),
                        appText(
                            txt: '5.30 PM',
                            size: AppConstants.largeText,
                            color: AppColors.whiteColor,
                            fw: FontWeight.bold)
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
      options: CarouselOptions(
        initialPage: 0,
        // aspectRatio: 16 / 9.5,
        viewportFraction: 0.96,
        animateToClosest: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,

        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
