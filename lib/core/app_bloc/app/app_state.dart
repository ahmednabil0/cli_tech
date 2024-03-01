part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.appBlocInitial() = _AppBlocInitialState;
  const factory AppState.changeLangLoading() = _ChangeLangLoadingState;
  const factory AppState.changeLangSucess() = _ChangeLangSucessState;
}
