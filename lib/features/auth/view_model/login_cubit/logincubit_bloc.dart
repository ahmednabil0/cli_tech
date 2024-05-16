// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/widgets/toast.dart';
import 'package:gradution_project/features/auth/model/repository/auth_repo.dart';
import 'package:gradution_project/features/patient/home/view/screens/bottom_nav.dart';
import 'package:gradution_project/features/patient/pending/view/pending_screen.dart';

part 'logincubit_state.dart';
part 'logincubit_bloc.freezed.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit({required this.authRepo})
      : super(const LoginCubitState.loginCubitInitial());
  final AuthRepository authRepo;

  //? Login Vars
  // keys
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  // Login Feild Coctrollers
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
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

  // void login() async {
  //   emit(const LoginCubitState.loginLoadingState());
  //   final result = await authRepo.login(
  //     email: email.text,
  //     password: pass.text,
  //   );
  //   result.fold(
  //     (error) => emit(LoginCubitState.loginErrorState(errorMessage: error)),
  //     (loginData) async {
  //       emit(const LoginCubitState.loginSuccessState());
  //     },
  //   );
  // }

  Future<void> login(BuildContext context) async {
    if (key.currentState!.validate()) {
      emit(const LoginCubitState.loginLoadingState());
      try {
        // ignore: unused_local_variable
        var result = await auth.signInWithEmailAndPassword(
          email: email.text,
          password: pass.text,
        );
        Map<String, dynamic>? credData; // ignore: unnecessary_null_comparison
        // ignore: use_build_context_synchronously

        await firestore
            .collection('doctors')
            .doc(result.user!.uid)
            .get()
            .then((value) {
          saveData(key: 'name', value: value.data()!['name']);
          saveData(key: 'email', value: value.data()!['email']);
          saveData(key: 'phone', value: value.data()!['phone']);
          saveData(key: 'uid', value: result.user!.uid);
          saveData(key: 'specialty', value: value.data()!['specialty']);
          saveData(key: 'role', value: value.data()!['role']);
          saveData(key: 'duid', value: value.data()!['duid']);
          saveData(key: 'pending', value: value.data()!['pending']);
          credData = value.data();
        });
        emit(const LoginCubitState.loginSuccessState());
        print(credData!['role']);
        if (credData!['role'] == 'patient') {
          if (credData!['role'] == 'patient' && credData!['pending'] == false) {
            navigateReplace(context: context, route: Routes.homePage);
          } else if (credData!['role'] == 'patient' &&
              credData!['pending'] == true) {
            navigateReplace(
                context: context, route: Routes.pendingPage, args: 'patient');
          }
        }
        if (credData!['role'] == 'doctor') {
          navigateReplace(context: context, route: Routes.doctorHomePage);
        }
        showToastSucess(
          msg: 'Sucess Sign in,',
          dismissibles: false,
          des: 'Hello Again ',
          context: context,
        );
        // ignore: unnecessary_null_comparison
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // Get.snackbar('erreo', 'user not found');
        } else if (e.code == 'wrong-password') {
          // Get.snackbar('error', 'wrong password');
        } else {
          // ignore: use_build_context_synchronously
          showToastError(
            msg: 'Error Occured',
            des: e.message.toString(),
            context: context,
          );
          emit(LoginCubitState.loginErrorState(
              errorMessage: e.message.toString()));
        }
      }
    }
  }

  Future<void> saveData({required String key, required dynamic value}) async {
    await sl<CacheHelper>().setData(key: key, value: value);
  }
}
