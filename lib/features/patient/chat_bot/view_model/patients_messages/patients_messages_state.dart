part of 'patients_messages_bloc.dart';

@freezed
class PatientsMessagesState with _$PatientsMessagesState {
  const factory PatientsMessagesState.initial() = _Initial;
  const factory PatientsMessagesState.loading() = _Loading;
  const factory PatientsMessagesState.error() = _Error;
  const factory PatientsMessagesState.loaded() = _Loaded;
}
