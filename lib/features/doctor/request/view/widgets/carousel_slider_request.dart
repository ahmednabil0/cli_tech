import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_const.dart';
import '../../../../../core/widgets/space.dart';
import '../../../../../core/widgets/text.dart';

class CarouselSliderRequest extends StatelessWidget {
  const CarouselSliderRequest({required this.count, super.key});

  final int? count;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: count ?? 5,
        itemBuilder: (context, index, realIndex) => Container(
              decoration: BoxDecoration(
                  //color: AppColors.scColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.blackColor)),
              child: SizedBox(
                width: 250.w,
                height: 215.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const WSizedBox(),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  image: const DecorationImage(
                                      image: AssetImage(AppConstants.person),
                                      fit: BoxFit.cover),
                                ),
                                width: 80.w,
                                height: 100.h,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 210.w,
                                  height: 20.h,
                                  child: ListTile(
                                    horizontalTitleGap: 3,
                                    contentPadding: EdgeInsets.zero,
                                    trailing: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_vert_rounded,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: appText(
                                          txt: 'ALi Ramadan, Male ,26yr',
                                          size: 16,
                                          fw: FontWeight.bold,
                                          of: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ),
                                HSizedBox(
                                  he: 15.h,
                                ),
                                SizedBox(
                                    width: 80.w,
                                    height: 15.h,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      dense: true,
                                      leading: Icon(
                                        Icons.person_rounded,
                                        color: AppColors.blackColor
                                            .withOpacity(0.5),
                                      ),
                                      title: appText(
                                          txt: 'Kiritika',
                                          size: AppConstants.smallText,
                                          fw: FontWeight.bold,
                                          of: TextOverflow.ellipsis,
                                          color: AppColors.blackColor
                                              .withOpacity(0.5)),
                                    )),
                                const HSizedBox(),
                                SizedBox(
                                    width: 210.w,
                                    height: 15.h,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      dense: true,
                                      leading: Icon(
                                        Icons.location_on,
                                        color: AppColors.blackColor
                                            .withOpacity(0.5),
                                      ),
                                      title: appText(
                                          txt: 'rediyarpalayam,puducherry',
                                          size: AppConstants.smallText,
                                          fw: FontWeight.bold,
                                          of: TextOverflow.ellipsis,
                                          color: AppColors.blackColor
                                              .withOpacity(0.5)),
                                    )),
                                const HSizedBox(),
                                SizedBox(
                                    width: 60.w,
                                    height: 15.h,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      dense: true,
                                      leading: Icon(
                                        Icons.place_rounded,
                                        color: AppColors.blackColor
                                            .withOpacity(0.5),
                                      ),
                                      title: appText(
                                          txt: '3 Km',
                                          size: AppConstants.smallText,
                                          fw: FontWeight.bold,
                                          of: TextOverflow.ellipsis,
                                          color: AppColors.blackColor
                                              .withOpacity(0.5)),
                                    )),
                                const HSizedBox(),
                                SizedBox(
                                    width: 180.w,
                                    height: 15.h,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      dense: true,
                                      leading: Icon(
                                        Icons.local_hospital_rounded,
                                        color: AppColors.blackColor
                                            .withOpacity(0.5),
                                      ),
                                      title: appText(
                                          txt: 'AGS Hospital,Moolakulam',
                                          size: AppConstants.smallText,
                                          fw: FontWeight.bold,
                                          of: TextOverflow.ellipsis,
                                          color: AppColors.blackColor
                                              .withOpacity(0.5)),
                                    )),
                                HSizedBox(
                                  he: 20.h,
                                ),
                                Row(
                                  children: [
                                    appText(
                                        txt: 'Time Limit :',
                                        size: AppConstants.smallText,
                                        fw: FontWeight.bold,
                                        of: TextOverflow.ellipsis,
                                        color: AppColors.blackColor
                                            .withOpacity(0.5)),
                                    const WSizedBox(),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(3.r)),
                                      width: 100.w,
                                      height: 20.h,
                                      child: Center(
                                          child: appText(
                                        txt: Jiffy.now()
                                            .format(pattern: 'yyyy/MM/d'),
                                        size: AppConstants.mediumText,
                                        color: Colors.white,
                                      )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: AppColors.blackColor,
                      endIndent: 5,
                      indent: 5,
                    ),
                    SizedBox(
                      height: 35.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextButton.icon(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15.r)),
                                  )),
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.red.withOpacity(0.5))),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.close_rounded,
                                size: 25,
                                color: AppColors.redColor,
                              ),
                              label: appText(
                                txt: 'Reject',
                                size: AppConstants.mediumText,
                                fw: FontWeight.bold,
                                color: AppColors.redColor,
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            color: AppColors.blackColor,
                            endIndent: 5,
                          ),
                          Expanded(
                            child: TextButton.icon(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15.r)),
                                  )),
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) =>
                                          Colors.green.withOpacity(0.5))),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.check,
                                size: 25,
                                color: Colors.green,
                              ),
                              label: appText(
                                txt: 'Accept',
                                size: AppConstants.mediumText,
                                fw: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
        options: CarouselOptions(
          initialPage: 0,
          padEnds: false,
          viewportFraction: 0.45,
          enableInfiniteScroll: false,
          scrollDirection: Axis.vertical,
        ));
  }
}
