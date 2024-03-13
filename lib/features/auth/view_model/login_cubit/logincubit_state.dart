part of 'logincubit_bloc.dart';

@freezed
class LoginCubitState with _$LoginCubitState {
  const factory LoginCubitState.loginCubitInitial() = _LoginCubitInitial;
  const factory LoginCubitState.changeLoginPasswordSuffixIcon() =
      _ChangeLoginPasswordSuffixIcon;
  const factory LoginCubitState.loginLoadingState() = _LoginLoadingState;
  const factory LoginCubitState.loginErrorState(
      {required String errorMessage}) = _LoginErrorState;
  const factory LoginCubitState.loginSuccessState() = _LoginSuccessState;
}
