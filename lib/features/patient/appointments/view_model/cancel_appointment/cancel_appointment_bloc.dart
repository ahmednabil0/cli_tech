import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'cancel_appointment_state.dart';
part 'cancel_appointment_bloc.freezed.dart';

class CancelAppointmentBloc extends Cubit<CancelAppointmentState> {
  CancelAppointmentBloc() : super(const CancelAppointmentState.initial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>>? appointments;
  Future<void> cancelAppointment() async {
    try {
      emit(const CancelAppointmentState.loading());
      await firestore
          .collection('appointments')
          .where('uid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .where('complete', isNotEqualTo: true)
          .get()
          .then((value) {
        appointments = value.docs.map((e) {
          Map<String, dynamic> data = e.data();
          return {...data, 'id': e.id};
        }).toList();
        for (var element in appointments!) {
          print(element);
        }
        emit(const CancelAppointmentState.loaded());
      });
    } catch (e) {
      print(e);
      emit(const CancelAppointmentState.failure());
    }
  }

  Future<void> cancelAppointmentById(String id) async {
    try {
      emit(const CancelAppointmentState.loading());
      await firestore.collection('appointments').doc(id).delete().then((value) {
        appointments!.removeWhere((element) => element['id'] == id);
        emit(const CancelAppointmentState.loaded());
      });
    } catch (e) {
      print(e);
      emit(const CancelAppointmentState.failure());
    }
  }
}
