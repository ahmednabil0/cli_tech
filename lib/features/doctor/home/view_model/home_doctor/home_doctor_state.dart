part of 'home_doctor_bloc.dart';

@freezed
class HomeDoctorState with _$HomeDoctorState {
  const factory HomeDoctorState.initial() = _Initial;
  const factory HomeDoctorState.dataLoading() = _DataLoading;
  const factory HomeDoctorState.dataLoaded() = _DataLoaded;
  const factory HomeDoctorState.dataError() = _DataError;
}
