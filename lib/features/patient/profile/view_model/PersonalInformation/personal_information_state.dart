part of 'personal_information_bloc.dart';

@freezed
class PersonalInformationState with _$PersonalInformationState {
  const factory PersonalInformationState.initial() = _InitialState;
  const factory PersonalInformationState.changeGenderLoading() =
      _ChangeGenderLoading;
  const factory PersonalInformationState.changeGenderLoaded() =
      _ChangeGenderLoaded;
}
