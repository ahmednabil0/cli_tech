part of 'signup_bloc.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.signUpInitial() = _SignUpInitial;
  const factory SignupState.changeSignUpPasswordSuffixIcon() =
      _ChangeSignUpPasswordSuffixIcon;
  const factory SignupState.signUpLoading() = _SignUpLoading;
  const factory SignupState.signUpError(String error) = _SignUpError;
  const factory SignupState.signUpScucess(String error) = _SignUpScucess;
}
