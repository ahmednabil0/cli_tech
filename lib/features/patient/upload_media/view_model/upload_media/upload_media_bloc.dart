import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'upload_media_state.dart';
part 'upload_media_bloc.freezed.dart';

class UploadMediaBloc extends Cubit<UploadMediaState> {
  UploadMediaBloc() : super(const UploadMediaState.initial());

  String? filePath;

  Future<void> openFilePicker(
    int index,
    String name,
    String id,
    Map<String, dynamic> data,
    BuildContext context,
  ) async {
    print(id);
    emit(UploadMediaState.uploadingMedia(index));

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      filePath = result.files.single.path;
      // ignore: avoid_print
      File file = File(filePath!);
      List newtests = [];
      if (data['tests'] != null) {
        newtests = data['tests'];
      }
      List tests = data['required_tests'];

      List updatesTeses = tests;
      print(data['required_tests'][index]);
      print(updatesTeses);
      print(newtests);
      String element = data['required_tests'][index];

      updatesTeses.remove(element);

      newtests.add(element);

      Reference ref =
          FirebaseStorage.instance.ref().child('media/${name + id}.pdf');

      UploadTask uploadTask = ref.putFile(file);

      await uploadTask;

      String downloadUrl = await ref.getDownloadURL();

      await firestore.collection('medical_records').doc(id).update(
        {
          name: downloadUrl,
          'required_tests': updatesTeses,
          'tests': newtests,
        },
      );

      // ignore: use_build_context_synchronously
      navigatePop(context: context);
      await getPatientMedicalRecords();

      emit(UploadMediaState.uploadedMedia(index));
    } else {
      emit(UploadMediaState.uploadfailureIngMedia(index));
    }
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>>? medicalRecords;

  // Implemnt Function
  Future<void> getPatientMedicalRecords() async {
    try {
      emit(const UploadMediaState.loading());
      await firestore
          .collection('medical_records')
          .where('uid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .where('required_tests', isNotEqualTo: [])
          .get()
          .then((value) async {
            medicalRecords = value.docs.map((e) {
              Map<String, dynamic> data = e.data();
              return {...data, 'id': e.id};
            }).toList();
            print(medicalRecords);
            emit(const UploadMediaState.loaded());
          });
    } catch (e) {
      emit(const UploadMediaState.error());
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
      emit(const UploadMediaState.loading());
      await firestore
          .collection('medical_records')
          .where('uid', isEqualTo: sl<CacheHelper>().getData(key: 'uid'))
          .where('date', isEqualTo: date)
          .get()
          .then((value) {
        medicalRecords = value.docs.map((e) {
          Map<String, dynamic> data = e.data();
          return {...data, 'id': e.id};
        }).toList();
        emit(const UploadMediaState.loaded());
      });
    } catch (e) {
      emit(const UploadMediaState.error());
    }
  }
}
