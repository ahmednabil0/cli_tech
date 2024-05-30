part of 'patient_records_bloc.dart';

@freezed
class PatientRecordsState with _$PatientRecordsState {
  const factory PatientRecordsState.initial() = _Initial;

  const factory PatientRecordsState.loading() = _Loading;

  const factory PatientRecordsState.loaded() = _Loaded;

  const factory PatientRecordsState.error() = _Error;
}
