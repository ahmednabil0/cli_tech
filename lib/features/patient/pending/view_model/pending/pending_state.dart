part of 'pending_bloc.dart';

@freezed
class PendingState with _$PendingState {
  const factory PendingState.initial() = _Initial;
  const factory PendingState.loadInProgress() = _LoadInProgress;
  const factory PendingState.loadedProgress() = _LoadedProgress;
  const factory PendingState.errorProgress() = _ErrorProgress;
}
