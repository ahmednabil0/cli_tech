import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logincubit_state.dart';
part 'logincubit_bloc.freezed.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(const LoginCubitState.loginCubitInitial());

  //? Login Vars
  // keys
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  // Login Feild Coctrollers
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  // value of obscuring passowrd feild
  bool isLoginPasswordShowing = true;
  //icon of password feild
  IconData suffixIcon = Icons.lock_rounded;

  //! Login functions

  // 1- change password icon and reflect to screen ui (changeLoginPasswordSuffixIcon)
  void changeLoginPasswordSuffixIcon() {
    emit(const LoginCubitState.loginCubitInitial());
    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
        isLoginPasswordShowing ? Icons.lock_rounded : Icons.lock_open_rounded;
    emit(const LoginCubitState.changeLoginPasswordSuffixIcon());
  }
}
