import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';

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
              color: AppColors.scColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: SizedBox(
              width: 250.w,
              height: 200.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HSizedBox(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(20.r),
                              image: const DecorationImage(
                                  image:
                                  AssetImage(AppConstants.person),
                                  fit: BoxFit.cover),
                            ),
                            width: 60.w,
                            height: 60.h,
                          ),
                          const HSizedBox(),
                          appText(
                              txt: 'Ali Ramadan',
                              size: AppConstants.largeText,
                              fw: FontWeight.bold),
                          Container(
                            width: 150.w,
                            height: 20.h,
                            color: Colors.pinkAccent.withOpacity(0.3),
                            child: Center(
                                child: appText(
                                    txt: 'Thyroid Dysfunction',
                                    size: AppConstants.mediumText,
                                    color: Colors.pinkAccent,
                                    fw: FontWeight.bold)),
                          ),
                          HSizedBox(
                            he: 12.h,
                          ),
                        ]),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: AppColors.scColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.r),
                              bottomRight: Radius.circular(16.r))),
                      width: 250.w,
                      height: 29.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_filled_rounded,
                            color: AppColors.whiteColor,
                          ),
                          const WSizedBox(),
                          appText(
                              txt: Jiffy.now()
                                  .format(pattern: 'h:mm a'),
                              size: AppConstants.largeText,
                              color: AppColors.whiteColor,
                              fw: FontWeight.bold)
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          initialPage: 0,
          viewportFraction: 0.85,
          enableInfiniteScroll: false,
          //reverse: true
        ));
  }
}
