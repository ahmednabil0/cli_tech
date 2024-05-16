part of 'personal_information_bloc.dart';

@freezed
class PersonalInformationState with _$PersonalInformationState {
  const factory PersonalInformationState.initial() = _InitialState;
  const factory PersonalInformationState.changeGenderLoading() =
      _ChangeGenderLoading;
  const factory PersonalInformationState.changeGenderLoaded() =
      _ChangeGenderLoaded;
  const factory PersonalInformationState.dataLoading() = _DataLoading;
  const factory PersonalInformationState.dataLoaded() = _DataLoaded;
  const factory PersonalInformationState.dataError(String error) = _DataError;
}
