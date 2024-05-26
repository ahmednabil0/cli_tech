import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'doctor_pendings_state.dart';
part 'doctor_pendings_bloc.freezed.dart';

class DoctorPendingsBloc extends Cubit<DoctorPendingsState> {
  DoctorPendingsBloc() : super(const DoctorPendingsState.initial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>>? pendingUsers;
  Future<void> getPending() async {
    try {
      emit(const DoctorPendingsState.loadInProgress());
      await firestore
          .collection('doctors')
          .where('duid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .where('pending', isEqualTo: true)
          .get()
          .then((value) {
        pendingUsers = value.docs.map((e) => e.data()).toList();
        print(pendingUsers);
      });
      emit(const DoctorPendingsState.loadedProgress());
    } catch (e) {
      emit(const DoctorPendingsState.errorProgress());
    }
  }

  Future<void> acceptRequest({required String uid}) async {
    try {
      emit(const DoctorPendingsState.loadInProgress());
      await firestore.collection('doctors').doc(uid).update({
        'pending': false,
      }).then((value) {
        pendingUsers!.removeWhere((element) => element['uid'] == uid);
        emit(const DoctorPendingsState.loadedProgress());
      });
    } catch (e) {
      emit(const DoctorPendingsState.errorProgress());
    }
  }

  Future<void> declineRequest({required String uid}) async {
    try {
      emit(const DoctorPendingsState.loadInProgress());
      await firestore.collection('doctors').doc(uid).delete().then((value) {
        pendingUsers!.removeWhere((element) => element['uid'] == uid);
        emit(const DoctorPendingsState.loadedProgress());
      });
    } catch (e) {
      emit(const DoctorPendingsState.errorProgress());
    }
  }
}
