part of 'prescrption_bloc.dart';

@freezed
class PrescrptionState with _$PrescrptionState {
  const factory PrescrptionState.initial() = _Initial;
  const factory PrescrptionState.prescrptionLoading() = _PrescrptionLoading;
  const factory PrescrptionState.prescrptionGenratedLoading() =
      _PrescrptionGenratedLoading;
  const factory PrescrptionState.prescrptionLoaded() = _PrescrptionLoaded;
  const factory PrescrptionState.prescrptionError() = _PrescrptionError;
  const factory PrescrptionState.prescrptionEmit() = _PrescrptionEmit;
}
