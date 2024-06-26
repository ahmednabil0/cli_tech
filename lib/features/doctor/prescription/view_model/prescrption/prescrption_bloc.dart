// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/static_data/drugs/data_json.dart';
import 'package:gradution_project/core/widgets/build_custom_dialog.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/features/doctor/prescription/view/widgets/typer_text.dart';

part 'prescrption_state.dart';
part 'prescrption_bloc.freezed.dart';

class PrescrptionBloc extends Cubit<PrescrptionState> {
  PrescrptionBloc() : super(const PrescrptionState.initial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formLapKey = GlobalKey<FormState>();
  GlobalKey<FormState> formSymKey = GlobalKey<FormState>();
  final TextEditingController drugQtController = TextEditingController();
  final TextEditingController reportController = TextEditingController();
  final TextEditingController tempController = TextEditingController();
  final TextEditingController bloodController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? drugName;
  String? testName;
  String? symptomName;

  String? drugQt;

  String? drugDu;

  List<Map> treatmantPlan = [];
  List<String> requiredTests = [];
  List<String> symptoms = [];

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

  void addSlash() {
    if (bloodController.text.length == 3 &&
        !bloodController.text.contains('/')) {
      emit(const PrescrptionState.initial());
      bloodController.text = '${bloodController.text}/';
      emit(const PrescrptionState.prescrptionEmit());
    }
  }

  void removeRequiredTest({required String value}) {
    emit(const PrescrptionState.initial());
    requiredTests.remove(value);
    emit(const PrescrptionState.prescrptionEmit());
  }

  void addSymptomToList(String symptomName) {
    emit(const PrescrptionState.initial());

    if (symptoms.contains(symptomName) == false) {
      symptoms.add(symptomName);
      print(symptoms.join(','));
    }

    emit(const PrescrptionState.prescrptionEmit());
  }

  void removeSymptom({required String value}) {
    emit(const PrescrptionState.initial());
    symptoms.remove(value);
    emit(const PrescrptionState.prescrptionEmit());
  }

  Future<void> addPrescription(
      Map<dynamic, dynamic> data, BuildContext context) async {
    try {
      emit(const PrescrptionState.prescrptionLoading());
      print('prescription added : ${data['id']}');

      await firestore.collection('medical_records').add({
        'drugs': treatmantPlan,
        'required_tests': requiredTests,
        'report': reportController.text,
        'temp': tempController.text,
        'blood': bloodController.text,
        'symptoms': symptoms,
        'duid': sl<CacheHelper>().getData(key: 'uid'),
        'uid': data['uid'],
        'name': data['name'],
        'date': data['date'],
        'hour': data['hour'],
        'age': '21',
        'type': data['type'],
      }).then((value) async {
        print('prescription added : ${data['id']}');
        await firestore
            .collection('appointments')
            .doc(data['id'])
            .update({'complete': true});
        print('prescription added : ${data['uid']}');
        await firestore.collection('doctors').doc(data['uid']).update({
          'report': reportController.text,
        });
        emit(const PrescrptionState.prescrptionLoaded());
        navigatePop(context: context);
      });
    } catch (e) {
      print('prescription error : ${e.toString()}');
      emit(const PrescrptionState.prescrptionError());
    }
  }

  Future<void> generateRecommendaions(
      List sympData, BuildContext context) async {
    try {
      emit(const PrescrptionState.prescrptionGenratedLoading());
      var headers = {'Content-Type': 'application/json'};
      var data = {"symptoms": sympData};
      var dio = Dio();
      var response = await dio.request(
        'http://159.223.237.9:8090/predict',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        Map<String, dynamic> result = response.data;
        print(result);

        showAlertDialog(
          context: context,
          widget: SingleChildScrollView(
            reverse: true,
            child: TypewriterText(
              text: formatApiResponse(result),
              typingDuration: const Duration(milliseconds: 50),
              pauseDuration: const Duration(milliseconds: 200),
            ),
          ),
          txt: 'Recommendaions generated successfully',
          color: AppColors.scColor,
          actions: [
            AppButton(
              txt: 'Back',
              onTap: () {
                navigatePop(context: context);
              },
            )
          ],
        );
      } else {
        print(response.statusMessage);
        print(response.statusCode);
      }

      emit(const PrescrptionState.prescrptionLoaded());
    } catch (e) {
      emit(const PrescrptionState.prescrptionError());
      print('prescription error : ${e.toString()}');
    }
  }
}
