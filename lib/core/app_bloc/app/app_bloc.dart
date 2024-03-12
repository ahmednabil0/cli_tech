import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/services/services_locator.dart';

part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.appBlocInitial());

  late String langCode;
  Future<void> changeLang(String codeLang) async {
    emit(const AppState.changeLangLoading());
    // isArabic=!isArabic;
    langCode = codeLang;
    await sl<CacheHelper>().cacheLanguage(codeLang);
    emit(const AppState.changeLangSucess());
  }

  void getCachedLang() {
    emit(const AppState.changeLangLoading());
    final cachedLang = sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
    emit(const AppState.changeLangSucess());
  }
}
