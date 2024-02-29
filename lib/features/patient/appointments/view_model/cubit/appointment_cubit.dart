import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_project/features/patient/appointments/view_model/cubit/appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentInitial());

  // vars
  List<DateTime> disabledDates = [];

  DateTime currentDate = DateTime.now();
  List<String> availableHours = [
    " 2.00 PM ",
    " 2.30 PM ",
    " 3.00 PM ",
    " 3.30 PM ",
    " 4.00 PM ",
    " 4.30 PM ",
    " 5.00 PM ",
    " 5.30 PM ",
    " 6.00 PM ",
    " 6.30 PM ",
    " 7.00 PM ",
    " 7.30 PM ",
    " 8.00 PM ",
  ];
  String? selectedHours;

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

  init() {
    int currentYear = currentDate.year;
    int currentMonth = currentDate.month;

    List<DateTime> allDatesInMonth = getDatesInMonth(currentYear, currentMonth);

    for (DateTime date in allDatesInMonth) {
      if (isDisabledDate(date)) {
        disabledDates.add(date);
      }
    }
  }

  //
  selectHour(String hour) {
    if (hour == selectedHours) {
      selectedHours = null;

      emit(
        RemoveHourState(),
      );
    } else {
      selectedHours = null;
      selectedHours = hour;

      emit(
        UpdateHourState(),
      );
    }
  }
}
