part of 'add_clinic_data_bloc.dart';

@freezed
class AddClinicDataState with _$AddClinicDataState {
  const factory AddClinicDataState.initial() = _Initial;
  const factory AddClinicDataState.loading() = _Loading;
  const factory AddClinicDataState.error(String msg) = _Error;
  const factory AddClinicDataState.scucess(String msg) = _Scucess;
  const factory AddClinicDataState.addOffDays() = _AddOffDays;
  const factory AddClinicDataState.removeOffDays() = _RemoveOffDays;
  const factory AddClinicDataState.updateFromHour() = _UpdateFromHour;
  const factory AddClinicDataState.updateAtHour() = _UpdateAtHour;
}
