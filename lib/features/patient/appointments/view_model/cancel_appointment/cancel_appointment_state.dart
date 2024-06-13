part of 'cancel_appointment_bloc.dart';

@freezed
class CancelAppointmentState with _$CancelAppointmentState {
  const factory CancelAppointmentState.initial() = _Initial;
  const factory CancelAppointmentState.loading() = _Loading;
  const factory CancelAppointmentState.loaded() = _Loaded;
  const factory CancelAppointmentState.failure() = _Failure;
}
