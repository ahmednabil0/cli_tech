import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/space.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:gradution_project/features/patient/appointments/view_model/cubit/appointment_cubit.dart';
import 'package:gradution_project/features/patient/appointments/view_model/cubit/appointment_state.dart';
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
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      //`selectedDate` the new date selected.
                    },
                    dayProps: EasyDayProps(
                      borderColor: AppColors.scColor.withOpacity(0.2),
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
                  SizedBox(
                    height: 50.h,
                    child: const MyRadioButtonWidget(),
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
            onTap: () {},
          ),
          HSizedBox(
            he: 10.h,
          )
        ],
      )),
    );
  }

  AppBar buildAppBar(
    String? title,
    BuildContext context,
  ) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          navigatePop(
            context: context,
          );
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: AppColors.scColor,
          size: 30.w,
        ),
      ),
      title: appText(
        txt: title ?? '',
        size: AppConstants.largeText,
        fw: FontWeight.w600,
      ),
    );
  }
}

class MyRadioButtonWidget extends StatefulWidget {
  const MyRadioButtonWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyRadioButtonWidgetState createState() => _MyRadioButtonWidgetState();
}

class _MyRadioButtonWidgetState extends State<MyRadioButtonWidget> {
  String _selectedRole = 'Retry';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
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
            value: 'Examination',
            groupValue: _selectedRole,
            onChanged: (value) {
              setState(() {
                _selectedRole = value!;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            title: appText(
                align: TextAlign.start,
                txt: 'Retry',
                size: AppConstants.verySmallText,
                fw: FontWeight.w600),
            activeColor: AppColors.scColor,
            value: 'Retry',
            groupValue: _selectedRole,
            onChanged: (value) {
              setState(() {
                _selectedRole = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
