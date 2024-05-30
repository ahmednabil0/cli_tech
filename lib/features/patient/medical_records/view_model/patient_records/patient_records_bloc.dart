import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'patient_records_state.dart';
part 'patient_records_bloc.freezed.dart';

class PatientRecordsBloc extends Cubit<PatientRecordsState> {
  PatientRecordsBloc() : super(const PatientRecordsState.initial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>>? medicalRecords;

  // Implemnt Function
  Future<void> getPatientMedicalRecords() async {
    try {
      emit(const PatientRecordsState.loading());
      await firestore
          .collection('medical_records')
          .where('uid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .get()
          .then((value) {
        medicalRecords = value.docs.map((e) => e.data()).toList();
        emit(const PatientRecordsState.loaded());
      });
    } catch (e) {
      emit(const PatientRecordsState.error());
    }
  }

  DateTime? yselectedDate;
  Future<DateTime?> showDateTimePicker(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.scColor,
              onPrimary: AppColors.whiteColor,
              onSurface: AppColors.scColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.scColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: yselectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      yselectedDate = selectedDate;
      await getPatientMedicalRecordsByDate(
          '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}');
    }

    return null;
  }

  Future<void> getPatientMedicalRecordsByDate(String date) async {
    try {
      emit(const PatientRecordsState.loading());
      await firestore
          .collection('medical_records')
          .where('uid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .where('date', isEqualTo: date)
          .get()
          .then((value) {
        medicalRecords = value.docs.map((e) => e.data()).toList();
        emit(const PatientRecordsState.loaded());
      });
    } catch (e) {
      emit(const PatientRecordsState.error());
    }
  }
}
