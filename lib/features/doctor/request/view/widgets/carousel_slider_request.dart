// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/build_custom_dialog.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/features/doctor/request/view_model/doctor_pendings/doctor_pendings_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_const.dart';
import '../../../../../core/widgets/space.dart';
import '../../../../../core/widgets/text.dart';

class CarouselSliderRequest extends StatelessWidget {
  const CarouselSliderRequest(
      {required this.data, required this.doctorPendingsBloc, super.key});

  final List<Map<String, dynamic>> data;
  final DoctorPendingsBloc doctorPendingsBloc;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => 15.he(),
      itemCount: data.length,
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
                                image: AssetImage(AppConstants.personDH),
                                fit: BoxFit.cover),
                          ),
                          width: 80.w,
                          height: 100.h,
                        ),
                      ),
                      20.wd(),
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
                                    txt: data[index]['name'],
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
                                  dense: true,
                                  leading: Icon(
                                    Icons.person_rounded,
                                    color:
                                        AppColors.blackColor.withOpacity(0.5),
                                  ),
                                  title: appText(
                                      txt: data[index]['role'],
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
                                      txt: data[index]['phone'],
                                      size: AppConstants.smallText,
                                      fw: FontWeight.bold,
                                      of: TextOverflow.ellipsis,
                                      color: AppColors.blackColor
                                          .withOpacity(0.5)),
                                )),
                            25.he(),
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
                        onPressed: () {
                          showAlertDialog(
                            context: context,
                            widget: appText(
                              txt:
                                  'Are You Sure To Reject This User/Receptioist Request.',
                              ml: 5,
                              fw: FontWeight.w400,
                              size: AppConstants.mediumText,
                              color: AppColors.scColor.withOpacity(0.7),
                            ),
                            txt: 'Warrning',
                            color: Colors.red,
                            actions: [
                              AppButton(
                                  txt: 'Cancel',
                                  color: AppColors.redColor,
                                  border: true,
                                  onTap: () {
                                    navigatePop(context: context);
                                  }),
                              AppButton(
                                txt: 'Reject',
                                color: AppColors.redColor,
                                onTap: () async {
                                  await doctorPendingsBloc.declineRequest(
                                      uid: data[index]['uid']);
                                  navigatePop(context: context);
                                },
                              ),
                            ],
                          );
                        },
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
                        onPressed: () {
                          showAlertDialog(
                            context: context,
                            widget: appText(
                              txt:
                                  'Are You Sure To Accept This User/Receptioist To Your Clinic.',
                              ml: 5,
                              fw: FontWeight.w400,
                              size: AppConstants.mediumText,
                              color: AppColors.scColor.withOpacity(0.7),
                            ),
                            txt: 'Warrning',
                            color: Colors.orangeAccent,
                            actions: [
                              AppButton(
                                  txt: 'Cancel',
                                  color: AppColors.primaryColor,
                                  border: true,
                                  onTap: () {
                                    navigatePop(context: context);
                                  }),
                              AppButton(
                                txt: 'Accept',
                                color: AppColors.primaryColor,
                                onTap: () async {
                                  await doctorPendingsBloc.acceptRequest(
                                      uid: data[index]['uid']);
                                  navigatePop(context: context);
                                },
                              ),
                            ],
                          );
                        },
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
