import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'home_doctor_state.dart';
part 'home_doctor_bloc.freezed.dart';

class HomeDoctorBloc extends Cubit<HomeDoctorState> {
  HomeDoctorBloc() : super(const HomeDoctorState.initial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>>? todayAppointments;

  Future<void> getData() async {
    print('********************');
    try {
      emit(const HomeDoctorState.dataLoading());

      await firestore
          .collection('appointments')
          .where('duid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .where('date',
              isEqualTo:
                  '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}')
          .get()
          .then((value) {
        todayAppointments = value.docs.map((e) => e.data()).toList();
      });
      emit(const HomeDoctorState.dataLoaded());
    } catch (e) {
      emit(const HomeDoctorState.dataError());
    }
  }
}
