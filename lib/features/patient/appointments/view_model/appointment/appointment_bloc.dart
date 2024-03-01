import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_state.dart';
part 'appointment_bloc.freezed.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(const AppointmentState.initial());
  // vars
  List<DateTime> disabledDates = [];

  DateTime currentDate = DateTime.now();
  List<String> availableHours = [
    "2.00 PM",
    "2.30 PM",
    "3.00 PM",
    "3.30 PM",
    "4.00 PM",
    "4.30 PM",
    "5.00 PM",
    "5.30 PM",
    "6.00 PM",
    "6.30 PM",
    "7.00 PM",
    "7.30 PM",
    "8.00 PM",
  ];
  String? selectedHours;
  DateTime? selectedDateTime;
  String selectedRole = 'Retry';
  String retryValue = 'Retry';
  String examinationvalue = 'Examination';
  void updateRadioButton(String value) {
    emit(const AppointmentState.initial());
    selectedRole = value;

    emit(const AppointmentState.updateRadioButtonState());
  }

  void updateDateTime(DateTime date) {
    emit(const AppointmentState.initial());
    selectedDateTime = date;

    emit(const AppointmentState.updateDateTimeState());
  }

// functions

  bool isDisabledDate(DateTime date) {
    return date.weekday == DateTime.friday || date.weekday == DateTime.thursday;
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

  initDisabledDays() {
    int currentYear = currentDate.year;
    int currentMonth = currentDate.month;

    List<DateTime> allDatesInMonth = getDatesInMonth(currentYear, currentMonth);

    for (DateTime date in allDatesInMonth) {
      if (isDisabledDate(date)) {
        disabledDates.add(date);
      }
    }
  }

  selectHour(String hour) {
    emit(const AppointmentState.initial());
    selectedHours = hour;
    emit(const AppointmentState.updateHourState());
  }
}
