part of 'appointment_bloc.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const factory AppointmentState.initial() = _AppointmentInitial;
  const factory AppointmentState.updateHourState() = _UpdateHourState;
  const factory AppointmentState.removeHourState() = _RemoveHourState;
  const factory AppointmentState.updateRadioButtonState() =
      _UpdateRadioButtonState;
  const factory AppointmentState.updateDateTimeState() = _UpdateDateTimeState;
  const factory AppointmentState.loadingState() = _LoadingState;

  const factory AppointmentState.errorState(String message) = _ErrorState;

  const factory AppointmentState.successState() = _SuccessState;
}
