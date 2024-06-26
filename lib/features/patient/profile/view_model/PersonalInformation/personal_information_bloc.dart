// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/widgets/toast.dart';

part 'personal_information_state.dart';
part 'personal_information_bloc.freezed.dart';

class PersonalInformationBloc extends Cubit<PersonalInformationState> {
  PersonalInformationBloc() : super(const PersonalInformationState.initial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map userdata = {};
  // change gender update ui
  String? currentGender;
  changeGender(String gender) {
    emit(const PersonalInformationState.changeGenderLoading());
    currentGender = gender;
    emit(const PersonalInformationState.changeGenderLoaded());
  }

  Future<void> getData() async {
    try {
      emit(const PersonalInformationState.dataLoading());
      await firestore
          .collection('doctors')
          .doc(sl<CacheHelper>().getData(key: 'uid'))
          .get()
          .then((value) {
        userdata = value.data()!;

        nameController.text = userdata['name'];
        emailController.text = userdata['email'];
        phoneController.text = userdata['phone'];
        ageController.text = userdata['age'] ?? '';
        addressController.text = userdata['address'] ?? '';
        currentGender = userdata['gender'] ?? '';

        emit(const PersonalInformationState.dataLoaded());
        print(userdata);
        print('*' * 100);
      });
    } catch (e) {
      emit(PersonalInformationState.dataError(e.toString()));
    }
  }

  Future<void> updateData() async {
    try {
      emit(const PersonalInformationState.dataLoading());

      await firestore
          .collection('doctors')
          .doc(sl<CacheHelper>().getData(key: 'uid'))
          .update({
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'age': ageController.text,
        'address': addressController.text,
        'gender': currentGender,
      });
      emit(const PersonalInformationState.dataLoaded());
    } catch (e) {
      emit(PersonalInformationState.dataError(e.toString()));
    }
  }

  Future<void> uploadProfilePhoto(BuildContext context) async {
    // Open file picker to select a photo
    try {
      emit(const PersonalInformationState.dataLoading());

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        String uid = sl<CacheHelper>().getData(key: 'uid');
        Reference ref =
            FirebaseStorage.instance.ref().child('profile_photos/$uid.jpg');

        UploadTask uploadTask = ref.putFile(file);

        await uploadTask;

        String downloadUrl = await ref.getDownloadURL();

        await firestore
            .collection('doctors')
            .doc(sl<CacheHelper>().getData(key: 'uid'))
            .update({
          'photo': downloadUrl,
        });
        print('download url: $downloadUrl');
        sl<CacheHelper>().setData(key: 'photo', value: downloadUrl);
      }

      emit(const PersonalInformationState.dataLoaded());
    } catch (e) {
      emit(PersonalInformationState.dataError(e.toString()));
      showToastError(
          msg: 'something went wrong', des: e.toString(), context: context);
    }
  }
}
