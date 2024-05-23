part of 'doctor_patients_bloc.dart';

@freezed
class DoctorPatientsState with _$DoctorPatientsState {
  const factory DoctorPatientsState.initial() = _Initial;
  const factory DoctorPatientsState.loadingData() = _LoadingData;
  const factory DoctorPatientsState.loadedData() = _LoadedData;
  const factory DoctorPatientsState.errorData(String error) = _ErrorData;
}
