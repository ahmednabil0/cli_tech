import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/space.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:gradution_project/features/patient/appointments/view_model/appointment/appointment_bloc.dart';

import 'package:easy_date_timeline/easy_date_timeline.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar('New Appointment', context),
      body: Background(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EasyDateTimeLine(
                    initialDate:
                        BlocProvider.of<AppointmentCubit>(context).currentDate,
                    onDateChange: (selectedDate) {
                      BlocProvider.of<AppointmentCubit>(context).updateDateTime(
                        selectedDate,
                      );
                    },
                    dayProps: EasyDayProps(
                      borderColor: AppColors.scColor.withOpacity(0.3),
                    ),
                    activeColor: AppColors.scColor,
                    disabledDates: BlocProvider.of<AppointmentCubit>(context)
                        .disabledDates,
                    locale: "ar",
                  ),
                  HSizedBox(he: 25.h),
                  appText(
                    txt: 'Available Time:',
                    size: AppConstants.largeText,
                    fw: FontWeight.w600,
                  ),
                  BlocBuilder<AppointmentCubit, AppointmentState>(
                      builder: (context, state) => Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 20.w,
                          children: BlocProvider.of<AppointmentCubit>(context)
                              .availableHours
                              .map((hour) {
                            return FilterChip(
                              backgroundColor: AppColors.hintColor.withOpacity(
                                0.15,
                              ),
                              selectedColor: AppColors.scColor,
                              shape: const StadiumBorder(),
                              checkmarkColor: AppColors.whiteColor,
                              labelStyle: TextStyle(
                                color:
                                    BlocProvider.of<AppointmentCubit>(context)
                                                .selectedHours ==
                                            hour
                                        ? AppColors.whiteColor
                                        : AppColors.fontColor,
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.w700,
                              ),
                              label: Text(hour.toString()),
                              selected:
                                  BlocProvider.of<AppointmentCubit>(context)
                                              .selectedHours ==
                                          hour
                                      ? true
                                      : false,
                              onSelected: (selected) {
                                print(selected);

                                BlocProvider.of<AppointmentCubit>(context)
                                    .selectHour(hour);

                                // BlocProvider.of<AppointmentCubit>(context)
                                //     .removetHour(hour);
                              },
                            );
                          }).toList())),
                  HSizedBox(he: 10.h),
                  appText(
                    txt: 'Notes:',
                    size: AppConstants.largeText,
                    fw: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: MyCustomTextField(
                      hint: 'Write Your Notes Here!',
                      controller: TextEditingController(),
                    ),
                  ),
                  HSizedBox(
                    he: 5.h,
                  ),
                  appText(
                    txt: 'Select :',
                    size: AppConstants.largeText,
                    fw: FontWeight.w600,
                  ),
                  BlocBuilder<AppointmentCubit, AppointmentState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 50.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: appText(
                                    txt: 'Examination',
                                    align: TextAlign.start,
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w600),
                                activeColor: AppColors.scColor,
                                value:
                                    BlocProvider.of<AppointmentCubit>(context)
                                        .examinationvalue,
                                groupValue:
                                    BlocProvider.of<AppointmentCubit>(context)
                                        .selectedRole,
                                onChanged: (value) {
                                  BlocProvider.of<AppointmentCubit>(context)
                                      .updateRadioButton(value.toString());
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: appText(
                                    align: TextAlign.start,
                                    txt: BlocProvider.of<AppointmentCubit>(
                                            context)
                                        .retryValue,
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w600),
                                activeColor: AppColors.scColor,
                                value: 'Retry',
                                groupValue:
                                    BlocProvider.of<AppointmentCubit>(context)
                                        .selectedRole,
                                onChanged: (value) {
                                  BlocProvider.of<AppointmentCubit>(context)
                                      .updateRadioButton(value.toString());
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          HSizedBox(
            he: 5.h,
          ),
          AppButton(
            w: 300.w,
            txt: 'Book Appointment',
            h: 45.h,
            tfw: FontWeight.w700,
            ts: AppConstants.largeText,
            onTap: () {
              navigateReplace(
                context: context,
                route: Routes.scussesBookingPage,
              );
            },
          ),
          HSizedBox(
            he: 10.h,
          )
        ],
      )),
    );
  }
}
