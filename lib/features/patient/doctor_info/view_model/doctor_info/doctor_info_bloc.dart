import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'doctor_info_state.dart';
part 'doctor_info_bloc.freezed.dart';

class DoctorInfoBloc extends Cubit<DoctorInfoState> {
  DoctorInfoBloc() : super(const DoctorInfoState.initial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? doctorInfo;

  Future<void> getDoctorInfo() async {
    try {
      emit(const DoctorInfoState.loading());

      await firestore
          .collection('doctors')
          .doc(sl<CacheHelper>().getData(key: 'duid'))
          .get()
          .then((value) {
        doctorInfo = value.data();
      });
      print(doctorInfo);
      print('*' * 20);
      emit(const DoctorInfoState.loaded());
    } catch (e) {
      emit(const DoctorInfoState.error());
    }
  }
}
