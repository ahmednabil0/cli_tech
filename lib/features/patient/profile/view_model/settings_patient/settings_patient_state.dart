part of 'settings_patient_bloc.dart';

@freezed
class SettingsPatientState with _$SettingsPatientState {
  const factory SettingsPatientState.initial() = _InitialState;
  const factory SettingsPatientState.changeLangLoading() = _ChangeLangLoading;
  const factory SettingsPatientState.changeLangLoaded() = _ChangeLangLoaded;
  const factory SettingsPatientState.changeLangError() = _ChangeLangError;
}
