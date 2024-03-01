part of 'signup_bloc.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.signUpInitial() = _SignUpInitial;
  const factory SignupState.changeSignUpPasswordSuffixIcon() =
      _ChangeSignUpPasswordSuffixIcon;
}
