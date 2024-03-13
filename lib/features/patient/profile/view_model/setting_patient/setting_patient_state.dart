part of 'setting_patient_bloc.dart';

@freezed
class SettingPatientState with _$SettingPatientState {
  const factory SettingPatientState.initial() = _InitialState;
  const factory SettingPatientState.changeLangLoading() = _ChangeLangLoading;
  const factory SettingPatientState.changeLangLoaded() = _ChangeLangLoaded;
  const factory SettingPatientState.changeLangError() = _ChangeLangError;
  const factory SettingPatientState.changeSwitchLoading() =
      _ChangeSwitchLoading;
  const factory SettingPatientState.changeSwitchLoaded() = _ChangeSwitchLoaded;
  const factory SettingPatientState.changeCurrentPasswordVisabilty() =
      _ChangeCurrentPasswordVisabilty;
  const factory SettingPatientState.changeNewPasswordVisabilty() =
      _ChangeNewPasswordVisabilty;
}
