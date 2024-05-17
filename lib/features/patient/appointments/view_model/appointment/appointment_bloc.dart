// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'appointment_state.dart';
part 'appointment_bloc.freezed.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(const AppointmentState.initial());
  // vars
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<DateTime> disabledDates = [];

  DateTime currentDate = DateTime.now();
  List<String>? availableHours;
  List<String>? availableHoursAll;
  String? selectedHours;
  DateTime? selectedDateTime;
  String selectedRole = 'Retry';
  String? fromTime;
  String? toTime;
  String retryValue = 'Retry';
  String examinationvalue = 'Examination';
  final TextEditingController notesController = TextEditingController();
  Map<String, dynamic>? data;
  void updateRadioButton(String value) {
    emit(const AppointmentState.initial());
    selectedRole = value;

    emit(const AppointmentState.updateRadioButtonState());
  }

  void updateDateTime(DateTime date) async {
    emit(const AppointmentState.initial());
    selectedDateTime = date;
    await getBookedHours();
    emit(const AppointmentState.updateDateTimeState());
  }

// functions

  int convertStringDayToDateTimeDay(String day) {
    Map days = {
      'Mon': DateTime.monday,
      'Tue': DateTime.tuesday,
      'Wed': DateTime.wednesday,
      'Thu': DateTime.thursday,
      'Fri': DateTime.friday,
      'Sat': DateTime.saturday,
      'Sun': DateTime.sunday
    };
    return days[day];
  }

  bool isDisabledDate(DateTime date, List<dynamic> disabledDays) {
    List<int> offDays =
        disabledDays.map((e) => convertStringDayToDateTimeDay(e)).toList();
    return offDays.contains(date.weekday);
  }

  List<DateTime> getDatesInMonth(int year, int month) {
    List<DateTime> dates = [];
    DateTime startDate = DateTime(year, month, 1);
    DateTime endDate = DateTime(year, month + 1, 0);

    for (int i = 0; i < endDate.day; i++) {
      DateTime date = startDate.add(Duration(days: i));
      dates.add(date);
    }

    return dates;
  }

  initDisabledDays(List<dynamic> disabledDays) {
    int currentYear = currentDate.year;
    int currentMonth = currentDate.month;

    List<DateTime> allDatesInMonth = getDatesInMonth(currentYear, currentMonth);

    for (DateTime date in allDatesInMonth) {
      if (isDisabledDate(date, disabledDays)) {
        disabledDates.add(date);
      }
    }
  }

  selectHour(String hour) {
    emit(const AppointmentState.initial());
    selectedHours = hour;
    emit(const AppointmentState.updateHourState());
  }

  List<String> getTimeRange(
      String startTimeStr, String endTimeStr, int interval) {
    List<String> timeRange = [];

    // Parse the start and end time strings
    TimeOfDay startTime = TimeOfDay(
      hour: int.parse(startTimeStr.split(' ')[0].split(':')[0]),
      minute: int.parse(startTimeStr.split(' ')[0].split(':')[1]),
    );
    TimeOfDay endTime = TimeOfDay(
      hour: int.parse(endTimeStr.split(' ')[0].split(':')[0]),
      minute: int.parse(endTimeStr.split(' ')[0].split(':')[1]),
    );

    // Convert start and end time to DateTime objects
    DateTime start = DateTime(2023, 1, 1, startTime.hour, startTime.minute);
    DateTime end = DateTime(2023, 1, 1, endTime.hour, endTime.minute);

    // Iterate through the time range and add each time point to the list
    while (start.isBefore(end) || start.isAtSameMomentAs(end)) {
      timeRange.add(
          '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')} AM');
      start = start.add(Duration(minutes: interval));
    }

    return timeRange;
  }

  Future<void> getTodayData() async {
    try {
      emit(const AppointmentState.loadingState());

      await firestore
          .collection('doctors')
          .doc(sl<CacheHelper>().getData(key: 'duid'))
          .get()
          .then((value) {
        initDisabledDays(value.data()!['offDays']);

        fromTime = value.data()!['fromTime'];
        toTime = value.data()!['toTime'];
      });

      emit(const AppointmentState.successState());
    } catch (e) {
      emit(AppointmentState.errorState(e.toString()));
    }
  }

  Future<void> bookAppointment(BuildContext context) async {
    try {
      if (selectedHours != null && selectedDateTime != null) {
        emit(const AppointmentState.loadingState());

        await firestore.collection('appointments').add({
          'duid': sl<CacheHelper>().getData(key: 'duid'),
          'date':
              '${selectedDateTime!.year}-${selectedDateTime!.month}-${selectedDateTime!.day}',
          'hour': selectedHours,
          'note': notesController.text,
          'type': selectedRole,
          'uid': sl<CacheHelper>().getData(key: 'uid'),
          'name': sl<CacheHelper>().getData(key: 'name'),
        });
        emit(const AppointmentState.successState());
        navigateReplace(
            context: context,
            route: Routes.scussesBookingPage,
            args: {
              'time': selectedHours,
              'date':
                  '${selectedDateTime!.year}-${selectedDateTime!.month}-${selectedDateTime!.day}',
              'type': selectedRole,
            });
      }
    } catch (e) {
      emit(AppointmentState.errorState(e.toString()));
    }
  }

  Future<void> getBookedHours() async {
    try {
      emit(const AppointmentState.loadingState());
      await firestore
          .collection('appointments')
          .where('duid', isEqualTo: sl<CacheHelper>().getData(key: 'duid'))
          .where('date',
              isEqualTo:
                  '${selectedDateTime!.year}-${selectedDateTime!.month}-${selectedDateTime!.day}')
          .get()
          .then((value) {
        availableHoursAll = getTimeRange(
          fromTime!,
          toTime!,
          30,
        );
        for (var element in value.docs) {
          String hour = element.data()['hour'];

          availableHoursAll!.remove(hour);
        }
        availableHours = availableHoursAll;
      });
      print(availableHours);
      emit(const AppointmentState.successState());
    } catch (e) {
      emit(AppointmentState.errorState(e.toString()));
    }
  }
}
