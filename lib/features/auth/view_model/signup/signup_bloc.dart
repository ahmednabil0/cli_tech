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
  String? doctorSpecialist;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
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

  Future<void> signUp(BuildContext context) async {
    String role = sl<CacheHelper>().getData(key: 'role');
    if (role == 'doctor') {
      if (key.currentState!.validate()) {
        emit(const SignupState.signUpLoading());
        try {
          // ignore: unused_local_variable
          var result = await auth.createUserWithEmailAndPassword(
            email: email.text,
            password: pass.text,
          );
          // ignore: unnecessary_null_comparison
          if (result != null) {
            // ignore: use_build_context_synchronously

            await firestore.collection('doctors').doc(result.user!.uid).set({
              'uid': result.user!.uid,
              'name': name.text,
              'email': email.text,
              'phone': phone.text,
              'role': role,
              'specialty': doctorSpecialist,
            });
            saveData(key: 'name', value: name.text);
            saveData(key: 'email', value: email.text);
            saveData(key: 'phone', value: phone.text);
            saveData(key: 'uid', value: result.user!.uid);
            saveData(key: 'specialty', value: doctorSpecialist);
          }
          emit(const SignupState.signUpScucess('done'));
          // ignore: use_build_context_synchronously
          showToastSucess(
            msg: 'Sucess Sign in,',
            dismissibles: false,
            des:
                'Hello doctor ${name.text}, now you can mange your clinic totaly online ',
            context: context,
          );
          // ignore: use_build_context_synchronously
          navigateReplace(context: context, route: Routes.doctorHomePage);
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
            emit(SignupState.signUpError(e.message.toString()));
          }
        }
      }
    }
    if (role == 'patient') {
      if (key.currentState!.validate()) {
        emit(const SignupState.signUpLoading());
        try {
          // ignore: unused_local_variable
          var result = await auth.createUserWithEmailAndPassword(
            email: email.text,
            password: pass.text,
          );
          // ignore: unnecessary_null_comparison
          if (result != null) {
            // ignore: use_build_context_synchronously

            await firestore.collection('doctors').doc(result.user!.uid).set({
              'uid': result.user!.uid,
              'name': name.text,
              'duid': doctorUid.text,
              'email': email.text,
              'phone': phone.text,
              'role': role,
              'pending': true,
            });
            saveData(key: 'name', value: name.text);
            saveData(key: 'email', value: email.text);
            saveData(key: 'phone', value: phone.text);
            saveData(key: 'uid', value: result.user!.uid);
            saveData(key: 'duid', value: doctorUid.text);
            saveData(key: 'pending', value: true);
          }
          emit(const SignupState.signUpScucess('done'));
          // ignore: use_build_context_synchronously

          // ignore: use_build_context_synchronously
          navigateReplace(
              context: context, route: Routes.pendingPage, args: 'patient');
          // ignore: use_build_context_synchronously
          showToastSucess(
            msg: 'Sucess Sign in,',
            dismissibles: false,
            des: 'Hello Mr ${name.text}, Wait Until Doctor Accept you. ',
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
            emit(SignupState.signUpError(e.message.toString()));
          }
        }
      }
    }
  }

  Future<void> saveData({required String key, required dynamic value}) async {
    await sl<CacheHelper>().setData(key: key, value: value);
  }
}
