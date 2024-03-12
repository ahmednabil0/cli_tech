import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_information_state.dart';
part 'personal_information_bloc.freezed.dart';

class PersonalInformationBloc extends Cubit<PersonalInformationState> {
  PersonalInformationBloc() : super(const PersonalInformationState.initial());

  // change gender update ui
  String currentGender = 'male';
  changeGender(String gender) {
    emit(const PersonalInformationState.changeGenderLoading());
    currentGender = gender;
    emit(const PersonalInformationState.changeGenderLoaded());
  }
}
