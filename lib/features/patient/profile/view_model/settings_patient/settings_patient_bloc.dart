import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/app_bloc/app/app_bloc.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'settings_patient_state.dart';
part 'settings_patient_bloc.freezed.dart';

class SettingsPatientBloc extends Cubit<SettingsPatientState> {
  SettingsPatientBloc() : super(const SettingsPatientState.initial());

  String arabicValue = 'ar';
  String englishValue = 'en';
  String? currentLang;
  initLangSetings() {
    currentLang = sl<CacheHelper>().getCachedLanguage();
    emit(const SettingsPatientState.changeLangLoaded());

    print('loaded');
    print(currentLang);
  }

  changeLang(String lang) async {
    try {
      emit(const SettingsPatientState.changeLangLoading());
      // await sl<CacheHelper>().cacheLanguage(lang);
      await sl<AppCubit>().changeLang(lang);
      currentLang = lang;
      emit(const SettingsPatientState.changeLangLoaded());
    } catch (e) {
      emit(const SettingsPatientState.changeLangError());
    }
  }
}
