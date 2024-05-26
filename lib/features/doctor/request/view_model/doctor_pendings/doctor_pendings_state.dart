part of 'doctor_pendings_bloc.dart';

@freezed
class DoctorPendingsState with _$DoctorPendingsState {
  const factory DoctorPendingsState.initial() = _Initial;
  const factory DoctorPendingsState.loadInProgress() = _LoadInProgress;
  const factory DoctorPendingsState.loadedProgress() = _LoadedProgress;
  const factory DoctorPendingsState.errorProgress() = _ErrorProgress;
}
