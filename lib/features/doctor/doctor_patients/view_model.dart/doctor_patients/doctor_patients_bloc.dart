import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'doctor_patients_state.dart';
part 'doctor_patients_bloc.freezed.dart';

class DoctorPatientsBloc extends Cubit<DoctorPatientsState> {
  DoctorPatientsBloc() : super(const DoctorPatientsState.initial());
  List<Map<String, dynamic>>? patients;
  List<Map<String, dynamic>>? medicalRecords;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController searchContrller = TextEditingController();
  Future<void> getDoctorPatients(String? query) async {
    try {
      emit(const DoctorPatientsState.loadingData());
      if (query == null) {
        await firestore
            .collection('doctors')
            .where('duid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
            .where('pending', isEqualTo: false)
            .get()
            .then((value) {
          patients = value.docs.map((e) => e.data()).toList();
          print('patients: $patients');
        });
      } else {
        await firestore
            .collection('doctors')
            .where('duid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
            .get()
            .then((value) {
          patients = value.docs.map((e) => e.data()).toList();
          patients = patients!
              .where((doc) => doc['name']
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
          print('patients: $patients');
        });
      }

      emit(const DoctorPatientsState.loadedData());
    } catch (e) {
      emit(DoctorPatientsState.errorData(e.toString()));
    }
  }

  Future<void> getMedicalRecords(String uid) async {
    try {
      emit(const DoctorPatientsState.loadingData());
      await firestore
          .collection('medical_records')
          .where('duid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .where('uid', isEqualTo: uid)
          .get()
          .then((value) {
        medicalRecords = value.docs.map((e) => e.data()).toList();
        for (var element in medicalRecords!) {
          print("element:$element");
        }
      });
      emit(const DoctorPatientsState.loadedData());
    } catch (e) {
      print(e);
    }
  }
}
