part of 'appointments_doctor_bloc.dart';

@freezed
class AppointmentsDoctorState with _$AppointmentsDoctorState {
  const factory AppointmentsDoctorState.initial() = _Initial;
  const factory AppointmentsDoctorState.dataLoading() = _DataLoading;
  const factory AppointmentsDoctorState.dataLoaded() = _DataLoaded;
  const factory AppointmentsDoctorState.dataError() = _DataError;
  const factory AppointmentsDoctorState.dataByDateLoading() =
      _DataByDateLoading;
  const factory AppointmentsDoctorState.dataByDateLoaded() = _DataByDateLoaded;
  const factory AppointmentsDoctorState.dataByDateError() = _DataByDateError;
}
