import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/extensions/gaps.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_const.dart';
import '../../../../../core/widgets/space.dart';
import '../../../../../core/widgets/text.dart';

class CarouselSliderHome extends StatelessWidget {
  const CarouselSliderHome({
    required this.count,
    super.key,
    required this.data,
  });
  final int count;
  final List<Map<String, dynamic>> data;

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
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            data[index]['photo']),
                                        fit: BoxFit.cover),
                                  ),
                                  width: 60.w,
                                  height: 60.h,
                                ),
                                5.he(),
                                appText(
                                    txt: data[index]['name'],
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
                                      txt: data[index]['date'],
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
                                      txt: data[index]['type'],
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
                            txt: data[index]['hour'],
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
