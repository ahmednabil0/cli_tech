import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/static_data/drugs/data_json.dart';

part 'prescrption_state.dart';
part 'prescrption_bloc.freezed.dart';

class PrescrptionBloc extends Cubit<PrescrptionState> {
  PrescrptionBloc() : super(const PrescrptionState.initial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formLapKey = GlobalKey<FormState>();
  final TextEditingController drugQtController = TextEditingController();
  final TextEditingController reportController = TextEditingController();
  final TextEditingController tempController = TextEditingController();
  final TextEditingController bloodController = TextEditingController();
  final TextEditingController symptomsController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? drugName;
  String? testName;

  String? drugQt;

  String? drugDu;

  List<Map> treatmantPlan = [];
  List<String> requiredTests = [];

  void addDrug({required DrugModel value}) {
    emit(const PrescrptionState.initial());
    drugName = '${value.name}/${value.type}';
    emit(const PrescrptionState.prescrptionEmit());
  }

  void addDrugQt({required String value}) {
    emit(const PrescrptionState.initial());
    drugQt = value;
    emit(const PrescrptionState.prescrptionEmit());
  }

  void addDrugDuration({required String value}) {
    emit(const PrescrptionState.initial());
    drugDu = value;
    emit(const PrescrptionState.prescrptionEmit());
  }

  void addDrugToTreatmentPlan() {
    emit(const PrescrptionState.initial());
    if (formKey.currentState!.validate()) {
      treatmantPlan.add(
        {
          'drug': drugName,
          'duration': drugDu,
          'times': drugQt,
        },
      );
    }
    emit(const PrescrptionState.prescrptionEmit());
  }

  void removeDrug(Map<dynamic, dynamic> hour) {
    emit(const PrescrptionState.initial());
    treatmantPlan.remove(hour);
    emit(const PrescrptionState.prescrptionEmit());
  }

  void addTest({required String value}) {
    emit(const PrescrptionState.initial());
    testName = value;
    emit(const PrescrptionState.prescrptionEmit());
  }

  void addRequiredTest() {
    emit(const PrescrptionState.initial());
    if (formLapKey.currentState!.validate()) {
      if (testName != null && requiredTests.contains(testName) == false) {
        requiredTests.add(testName!);
      }
    }
    emit(const PrescrptionState.prescrptionEmit());
  }

  void removeRequiredTest({required String value}) {
    emit(const PrescrptionState.initial());
    requiredTests.remove(value);
    emit(const PrescrptionState.prescrptionEmit());
  }

  Future<void> addPrescription(Map<dynamic, dynamic> data) async {
    try {
      emit(const PrescrptionState.prescrptionLoading());
      await firestore.collection('medical_records').add({
        'drugs': treatmantPlan,
        'required_tests': requiredTests,
        'report': reportController.text,
        'temp': tempController.text,
        'blood': bloodController.text,
        'symptoms': symptomsController.text,
        'duid': sl<CacheHelper>().getData(key: 'uid'),
        'uid': data['uid'],
        'name': data['name'],
        'date': data['date'],
        'hour': data['hour'],
        'age': '21',
        'type': data['type'],
      }).then((value) async {
        await firestore
            .collection('appointments')
            .doc(data['id'])
            .update({'complete': true});
        emit(const PrescrptionState.prescrptionLoaded());
      });
    } catch (e) {
      emit(const PrescrptionState.prescrptionError());
    }
  }
}
