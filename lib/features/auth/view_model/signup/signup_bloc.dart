import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.dart';
part 'signup_bloc.freezed.dart';

class SignupBloc extends Cubit<SignupState> {
  SignupBloc() : super(const SignupState.signUpInitial());
  // data
  final key = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();

  final TextEditingController pass = TextEditingController();

  final TextEditingController name = TextEditingController();

  final TextEditingController phone = TextEditingController();

  final TextEditingController doctorUid = TextEditingController();
  bool isLoginPasswordShowing = true;
  IconData suffixIcon = Icons.lock_rounded;

  // functions

  void changeLoginPasswordSuffixIcon() {
    emit(const SignupState.signUpInitial());

    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
        isLoginPasswordShowing ? Icons.lock_rounded : Icons.lock_open_rounded;

    emit(const SignupState.changeSignUpPasswordSuffixIcon());
  }
}
