import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/widgets/toast.dart';
import 'package:gradution_project/features/doctor/complete_data/model/clinic_data_model.dart';

part 'add_clinic_data_state.dart';
part 'add_clinic_data_bloc.freezed.dart';

class AddClinicDataBloc extends Cubit<AddClinicDataState> {
  AddClinicDataBloc() : super(const AddClinicDataState.initial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController aboutMeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController numOfYearsController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map address = {};
  List<String> offDays = [];
  Time time = Time(hour: 11, minute: 30, second: 20);
  Time? fromTime;
  Time? toTime;
  // clinic data
  ClinicDataModel? clinicData;

  void addOffDays(bool selected, String hour) {
    emit(const AddClinicDataState.initial());
    if (selected) {
      if (!offDays.contains(hour)) {
        offDays.add(hour);
        emit(const AddClinicDataState.addOffDays());
      }
    } else {
      offDays.remove(hour);
      emit(const AddClinicDataState.removeOffDays());
    }
    print(offDays);
  }

  void changeFromHour(Time newTime) {
    emit(const AddClinicDataState.initial());
    fromTime = newTime;
    emit(const AddClinicDataState.updateFromHour());
  }

  void changeToHour(Time newTime) {
    emit(const AddClinicDataState.initial());
    toTime = newTime;
    emit(const AddClinicDataState.updateAtHour());
  }

  Future<void> completeClinicData(BuildContext context) async {
    try {
      emit(const AddClinicDataState.loading());
      firestore
          .collection('doctors')
          .doc(sl<CacheHelper>().getData(key: 'uid'))
          .update({
        'aboutMe': aboutMeController.text,
        'address': addressController.text,
        'numOfYears': numOfYearsController.text,
        'offDays': offDays,
        'fromTime': fromTime!.format(context),
        'toTime': toTime!.format(context),
        'addressDetails': address
      }).then((value) {
        showToastSucess(
          msg: 'Success',
          des: 'Clinic Data Added Successfully',
          context: context,
        );
        emit(const AddClinicDataState.scucess('Success'));
        showToastSucess(
          msg: 'Success',
          des: 'Clinic Data Added Successfully',
          context: context,
        );
      });
    } catch (e) {
      emit(AddClinicDataState.error(e.toString()));
    }
  }

  Future<void> getCLinicData() async {
    emit(const AddClinicDataState.loading());
    try {
      await firestore
          .collection('doctors')
          .doc(sl<CacheHelper>().getData(key: 'uid'))
          .get()
          .then((value) {
        // ignore: unnecessary_null_comparison
        if (value.data != null) {
          clinicData = ClinicDataModel.fromMap(value.data()!);

          aboutMeController.text = clinicData!.aboutMe;
          addressController.text = clinicData!.address;
          numOfYearsController.text = clinicData!.numOfYears;
          offDays = clinicData!.offDays;
          address = clinicData!.addressDetails;

          // addressController.text = clinicData!['address'];
          // numOfYearsController.text = clinicData!['numOfYears'].toString();
          // offDays = clinicData!['offDays'];
          fromTime = Time(
            hour: int.parse(
                clinicData!.fromTime.toString().split(' ')[0].split(':')[0]),
            minute: int.parse(
                clinicData!.fromTime.toString().split(' ')[0].split(':')[1]),
          );
          toTime = Time(
            hour: int.parse(
                clinicData!.toTime.toString().split(' ')[0].split(':')[0]),
            minute: int.parse(
                clinicData!.toTime.toString().split(' ')[0].split(':')[1]),
          );
        }
      });
      emit(const AddClinicDataState.scucess('msg'));
    } catch (e) {
      emit(AddClinicDataState.error(e.toString()));
    }
  }
}
