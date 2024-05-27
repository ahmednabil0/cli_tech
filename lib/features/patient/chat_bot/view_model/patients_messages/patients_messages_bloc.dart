import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'patients_messages_state.dart';
part 'patients_messages_bloc.freezed.dart';

class PatientsMessagesBloc extends Cubit<PatientsMessagesState> {
  PatientsMessagesBloc() : super(const PatientsMessagesState.initial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController msgController = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  Future<void> sendMessage() async {
    if (msgController.text.isNotEmpty) {
      try {
        emit(const PatientsMessagesState.loading());
        await firestore.collection('messages').add({
          'from': sl<CacheHelper>().getData(key: 'uid'),
          'to': sl<CacheHelper>().getData(key: 'duid'),
          'msg': msgController.text,
          'createdAt': DateTime.now(),
          'reply': "",
        }).then((value) async {
          print('message added : ${value.id}');
          msgController.clear();

          emit(const PatientsMessagesState.loaded());
          await getMyMessages();
        });
      } catch (e) {
        emit(const PatientsMessagesState.error());
      }
    }
  }

  Future<void> getMyMessages() async {
    print('*****************************');

    try {
      print('*****************************');

      emit(const PatientsMessagesState.loading());
      await firestore
          .collection('messages')
          .where('from', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .where('to', isEqualTo: sl<CacheHelper>().getData(key: 'duid'))
          .orderBy('createdAt', descending: true)
          .get()
          .then((value) {
        messages = value.docs.map((e) => e.data()).toList().reversed.toList();
        emit(const PatientsMessagesState.loaded());
      });
    } catch (e) {
      emit(const PatientsMessagesState.error());
    }
  }
}
