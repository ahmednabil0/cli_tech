import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
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
    return ListView.separated(
      separatorBuilder: (context, index) => 15.he(),
      itemCount: count ?? 5,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            //color: AppColors.scColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: AppColors.blackColor)),
        child: SizedBox(
          height: 180.h,
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
                      7.wd(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                              child: ListTile(
                                horizontalTitleGap: 3,
                                contentPadding: EdgeInsets.zero,
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: appText(
                                    txt: 'ALi Ramadan',
                                    align: TextAlign.start,
                                    size: AppConstants.largeText,
                                    fw: FontWeight.w800,
                                    of: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            HSizedBox(
                              he: 15.h,
                            ),
                            SizedBox(
                                height: 15.h,
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                  dense: true,
                                  leading: Icon(
                                    Icons.person_rounded,
                                    color:
                                        AppColors.blackColor.withOpacity(0.5),
                                  ),
                                  title: appText(
                                      txt: index.isEven
                                          ? 'patient'
                                          : 'receptionist',
                                      size: AppConstants.smallText,
                                      fw: FontWeight.bold,
                                      of: TextOverflow.ellipsis,
                                      color: AppColors.blackColor
                                          .withOpacity(0.5)),
                                )),
                            const HSizedBox(),
                            SizedBox(
                                height: 15.h,
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                  dense: true,
                                  leading: Icon(
                                    Icons.phone_enabled_rounded,
                                    color:
                                        AppColors.blackColor.withOpacity(0.5),
                                  ),
                                  title: appText(
                                      txt: '01025232565',
                                      size: AppConstants.smallText,
                                      fw: FontWeight.bold,
                                      of: TextOverflow.ellipsis,
                                      color: AppColors.blackColor
                                          .withOpacity(0.5)),
                                )),
                            25.he(),
                            Row(
                              children: [
                                appText(
                                    txt: 'Time Limit :',
                                    size: AppConstants.smallText,
                                    fw: FontWeight.bold,
                                    of: TextOverflow.ellipsis,
                                    color:
                                        AppColors.blackColor.withOpacity(0.5)),
                                const WSizedBox(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  height: 25.h,
                                  width: 100,
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
                                RoundedRectangleBorder>(RoundedRectangleBorder(
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
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15.r)),
                            )),
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.green.withOpacity(0.5))),
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
    );
  }
}
