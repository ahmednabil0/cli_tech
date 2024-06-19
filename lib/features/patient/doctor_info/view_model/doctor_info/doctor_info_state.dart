part of 'doctor_info_bloc.dart';

@freezed
class DoctorInfoState with _$DoctorInfoState {
  const factory DoctorInfoState.initial() = _Initial;
  const factory DoctorInfoState.loading() = _Loading;
  const factory DoctorInfoState.error() = _Error;
  const factory DoctorInfoState.loaded() = _Loaded;
}
