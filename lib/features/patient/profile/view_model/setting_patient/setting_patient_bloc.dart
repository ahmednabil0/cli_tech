import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/app_bloc/app/app_bloc.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'setting_patient_state.dart';
part 'setting_patient_bloc.freezed.dart';

class SettingPatientBloc extends Cubit<SettingPatientState> {
  SettingPatientBloc() : super(const SettingPatientState.initial());

  String arabicValue = 'ar';
  String englishValue = 'en';
  String? currentLang;
  initLangSetings() {
    currentLang = sl<CacheHelper>().getCachedLanguage();
    emit(const SettingPatientState.changeLangLoaded());

    print('loaded');
    print(currentLang);
  }

  changeLang(String lang) async {
    try {
      emit(const SettingPatientState.changeLangLoading());
      // await sl<CacheHelper>().cacheLanguage(lang);
      await sl<AppCubit>().changeLang(lang);
      currentLang = lang;
      emit(const SettingPatientState.changeLangLoaded());
    } catch (e) {
      emit(const SettingPatientState.changeLangError());
    }
  }

  bool switchValue = true;
  changeSwitch(bool value) {
    emit(const SettingPatientState.changeSwitchLoading());
    switchValue = value;
    emit(const SettingPatientState.changeSwitchLoaded());
  }

  //? Change pass Vars
  // keys
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  // Login Feild Coctrollers
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  // value of obscuring passowrd feild
  bool isCurrentPasswordShowing = true;
  bool isNewPasswordShowing = true;
  //icon of password feild
  IconData suffixIconCurrent = Icons.lock_rounded;
  IconData suffixIconNew = Icons.lock_rounded;

  void changeLoginPasswordSuffixIcon(bool currentPassword) {
    if (currentPassword) {
      emit(const SettingPatientState.initial());

      isCurrentPasswordShowing = !isCurrentPasswordShowing;
      suffixIconCurrent = isCurrentPasswordShowing
          ? Icons.lock_rounded
          : Icons.lock_open_rounded;
      emit(const SettingPatientState.changeCurrentPasswordVisabilty());
    } else {
      emit(const SettingPatientState.initial());
      isNewPasswordShowing = !isNewPasswordShowing;
      suffixIconNew =
          isNewPasswordShowing ? Icons.lock_rounded : Icons.lock_open_rounded;
      emit(const SettingPatientState.changeNewPasswordVisabilty());
    }
  }
}
