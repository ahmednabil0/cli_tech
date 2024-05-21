import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/features/doctor/appointments/view_model/appointments_doctor/appointments_doctor_bloc.dart';
import 'package:jiffy/jiffy.dart';

// ignore: must_be_immutable
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
          BlocBuilder<AppointmentsDoctorBloc, AppointmentsDoctorState>(
            builder: (context, state) {
              return Expanded(
                  child: PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  state == const AppointmentsDoctorState.dataLoaded()
                      ? UpcomingApoointments(
                          count:
                              BlocProvider.of<AppointmentsDoctorBloc>(context)
                                  .todayAppointments!
                                  .length,
                          todayAppointments:
                              BlocProvider.of<AppointmentsDoctorBloc>(context)
                                  .todayAppointments!,
                        )
                      : state ==
                              const AppointmentsDoctorState.dataByDateLoading()
                          ? const Center(
                              child:
                                  SpinKitFadingCube(color: AppColors.scColor),
                            )
                          : const SizedBox.shrink(),
                  Column(
                    children: [
                      EasyDateTimeLine(
                        initialDate: Jiffy.now().dateTime,
                        dayProps: EasyDayProps(
                          borderColor: AppColors.scColor.withOpacity(0.3),
                        ),
                        activeColor: AppColors.scColor,
                        locale: "ar",
                        onDateChange: (selectedDate) async {
                          await BlocProvider.of<AppointmentsDoctorBloc>(context)
                              .getDataByDate(
                                  '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}');
                        },
                      ),
                      30.he(),
                      state ==
                                  const AppointmentsDoctorState
                                      .dataByDateLoaded() ||
                              BlocProvider.of<AppointmentsDoctorBloc>(context)
                                      .todayAppointments !=
                                  null
                          ? Expanded(
                              child: UpcomingApoointments(
                              todayAppointments: state ==
                                      const AppointmentsDoctorState
                                          .dataByDateLoaded()
                                  ? BlocProvider.of<AppointmentsDoctorBloc>(
                                          context)
                                      .todayAppointmentsByDate!
                                  : BlocProvider.of<AppointmentsDoctorBloc>(
                                                  context)
                                              .todayAppointments !=
                                          null
                                      ? BlocProvider.of<AppointmentsDoctorBloc>(
                                              context)
                                          .todayAppointments!
                                      : [],
                              count: state ==
                                      const AppointmentsDoctorState
                                          .dataByDateLoaded()
                                  ? BlocProvider.of<AppointmentsDoctorBloc>(
                                          context)
                                      .todayAppointmentsByDate!
                                      .length
                                  : BlocProvider.of<AppointmentsDoctorBloc>(
                                                  context)
                                              .todayAppointments !=
                                          null
                                      ? BlocProvider.of<AppointmentsDoctorBloc>(
                                              context)
                                          .todayAppointments!
                                          .length
                                      : 0,
                            ))
                          : state ==
                                  const AppointmentsDoctorState
                                      .dataByDateLoading()
                              ? const Center(
                                  child: SpinKitFadingFour(
                                    color: AppColors.scColor,
                                  ),
                                )
                              : const SizedBox.shrink(),
                    ],
                  )
                ],
              ));
            },
          ),
          20.he(),
        ],
      )),
    );
  }
}

class UpcomingApoointments extends StatelessWidget {
  UpcomingApoointments({
    super.key,
    required this.todayAppointments,
    required this.count,
  });
  final List<Map<String, dynamic>> todayAppointments;
  int count;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: count,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                todayAppointments[index]['photo']),
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
                            txt: todayAppointments[index]['name'],
                            size: AppConstants.largeText,
                            fw: FontWeight.bold,
                          ),
                          5.he(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                    txt: '21 Age',
                                    size: AppConstants.mediumText,
                                    color: AppColors.fontColor,
                                    fw: FontWeight.w700,
                                  ),
                                ),
                              ),
                              10.wd(),
                              Container(
                                height: 30.h,
                                padding: EdgeInsets.symmetric(horizontal: 7.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10.r,
                                  ),
                                  color: todayAppointments[index]['type'] ==
                                          'Examination'
                                      ? AppColors.redColor.withOpacity(0.2)
                                      : AppColors.primaryColor.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: appText(
                                    txt: todayAppointments[index]['type'],
                                    size: AppConstants.mediumText,
                                    color: todayAppointments[index]['type'] ==
                                            'Examination'
                                        ? AppColors.redColor
                                        : AppColors.primaryColor,
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
                5.he(),
                appText(
                  ml: 5,
                  align: TextAlign.start,
                  txt: 'Note: ${todayAppointments[index]['note']}',
                  size: AppConstants.smallText,
                  color: AppColors.hintColor,
                  fw: FontWeight.w500,
                ),
                5.he(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 30.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: AppColors.scColor,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: AppColors.scColor,
                            ),
                            appText(
                              txt: todayAppointments[index]['hour'],
                              ph: 5.h,
                              pw: 2.w,
                              size: AppConstants.mediumText,
                              color: AppColors.fontColor,
                              fw: FontWeight.w800,
                            ),
                          ],
                        ),
                      ),
                    ),
                    15.wd(),
                    Expanded(
                      child: AppButton(
                        h: 30.h,
                        color: AppColors.scColor.withOpacity(0.9),
                        txt: 'Start',
                        onTap: () {
                          navigateReplace(
                            context: context,
                            route: Routes.prescriptionPage,
                            args: {
                              'id': todayAppointments[index]['uid'],
                              'name': todayAppointments[index]['name'],
                              'date': todayAppointments[index]['date'],
                              'hour': todayAppointments[index]['hour'],
                              'type': todayAppointments[index]['type'],
                              'age': '21',
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
