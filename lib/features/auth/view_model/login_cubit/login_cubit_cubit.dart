import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_project/features/auth/view_model/login_cubit/login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial());

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  bool isLoginPasswordShowing = true;
  IconData suffixIcon = Icons.lock_rounded;
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
        isLoginPasswordShowing ? Icons.lock_rounded : Icons.lock_open_rounded;
    emit(ChangeLoginPasswordSuffixIcon());
  }
}
