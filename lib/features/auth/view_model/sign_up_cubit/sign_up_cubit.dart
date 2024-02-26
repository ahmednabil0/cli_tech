import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_project/features/auth/view_model/sign_up_cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

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
    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
        isLoginPasswordShowing ? Icons.lock_rounded : Icons.lock_open_rounded;
    emit(ChangeSignUpPasswordSuffixIcon());
  }
}
