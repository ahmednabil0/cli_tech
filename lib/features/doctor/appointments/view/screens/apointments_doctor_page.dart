import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:jiffy/jiffy.dart';

class DoctorAppointmentPage extends StatefulWidget {
  DoctorAppointmentPage({super.key});

  int currentIndex = 0;

  @override
  State<DoctorAppointmentPage> createState() => _DoctorAppointmentPageState();
}

class _DoctorAppointmentPageState extends State<DoctorAppointmentPage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Appointments', context: context),
      body: Background(
          child: Column(
        children: [
          20.he(),
          Container(
            width: 300.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (widget.currentIndex != 0) {
                        controller.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                        );
                        widget.currentIndex = 0;
                        setState(() {});
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: widget.currentIndex == 0
                            ? AppColors.scColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: appText(
                        txt: 'Upcoming',
                        size: AppConstants.largeText,
                        color: widget.currentIndex == 0
                            ? AppColors.whiteColor
                            : AppColors.scColor,
                        fw: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (widget.currentIndex != 1) {
                        controller.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                        );
                        widget.currentIndex = 1;
                        setState(() {});
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: widget.currentIndex == 1
                            ? AppColors.scColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: appText(
                        txt: 'Schedule',
                        size: AppConstants.largeText,
                        color: widget.currentIndex == 1
                            ? AppColors.whiteColor
                            : AppColors.scColor,
                        fw: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          25.he(),
          Expanded(
              child: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const UpcomingApoointments(),
              Column(
                children: [
                  EasyDateTimeLine(
                    initialDate: Jiffy.now().dateTime,
                    dayProps: EasyDayProps(
                      borderColor: AppColors.scColor.withOpacity(0.3),
                    ),
                    activeColor: AppColors.scColor,
                    locale: "ar",
                  ),
                  30.he(),
                  const Expanded(child: UpcomingApoointments()),
                ],
              )
            ],
          ))
        ],
      )),
    );
  }
}

class UpcomingApoointments extends StatelessWidget {
  const UpcomingApoointments({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) {
        return 10.he();
      },
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 0,
          color: AppColors.whiteColor,
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              children: [
                Row(
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
                    15.wd(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText(
                            txt: 'Ali Ramadan',
                            size: AppConstants.largeText,
                            fw: FontWeight.bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 30.h,
                                padding: EdgeInsets.symmetric(horizontal: 7.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10.r,
                                  ),
                                  color: AppColors.scColor.withOpacity(0.2),
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
                              Container(
                                height: 30.h,
                                padding: EdgeInsets.symmetric(horizontal: 7.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10.r,
                                  ),
                                  color: AppColors.scColor.withOpacity(0.2),
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
                  ],
                ),
                15.he(),
                AppButton(
                  w: 300.w,
                  h: 30.h,
                  color: AppColors.scColor.withOpacity(0.9),
                  txt: 'Start Examination',
                  onTap: () {
                    navigateReplace(
                      context: context,
                      route: Routes.prescriptionPage,
                      args: {
                        'id': 100000000021,
                        'name': "Ahmed Ali",
                      },
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
