import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'appointments_doctor_state.dart';
part 'appointments_doctor_bloc.freezed.dart';

class AppointmentsDoctorBloc extends Cubit<AppointmentsDoctorState> {
  AppointmentsDoctorBloc() : super(const AppointmentsDoctorState.initial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>>? todayAppointments;
  List<Map<String, dynamic>>? todayAppointmentsByDate;

  Future<void> getData() async {
    try {
      emit(const AppointmentsDoctorState.dataLoading());
      // todayAppointments = [];
      await _firestore
          .collection('appointments')
          .where('duid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .where('date',
              isEqualTo:
                  '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}')
          .get()
          .then((value) {
        todayAppointments = value.docs.map((e) {
          Map<String, dynamic> data = e.data();
          return {...data, 'id': e.id};
        }).toList();

        print(todayAppointments!);
        print('************************');
      });
      emit(const AppointmentsDoctorState.dataLoaded());
    } catch (e) {
      emit(const AppointmentsDoctorState.dataError());
    }
  }

  Future<void> getDataByDate(String date) async {
    try {
      emit(const AppointmentsDoctorState.dataByDateLoading());
      todayAppointmentsByDate = [];
      await _firestore
          .collection('appointments')
          .where('duid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .where('date', isEqualTo: date)
          .get()
          .then((value) {
        todayAppointmentsByDate = value.docs.map((e) => e.data()).toList();
      });
      emit(const AppointmentsDoctorState.dataByDateLoaded());
    } catch (e) {
      emit(const AppointmentsDoctorState.dataByDateError());
    }
  }
}
