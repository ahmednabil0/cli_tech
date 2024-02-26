import 'package:flutter_bloc/flutter_bloc.dart';

import '../db/cache/cache_helper.dart';
import '../services/services_locator.dart';
import 'app_bloc_state.dart';

class AppBlocCubit extends Cubit<AppBlocState> {
  AppBlocCubit() : super(AppBlocInitial());

  late String langCode;
  void changeLang(String codeLang) async {
    emit(ChangeLangLoading());
    // isArabic=!isArabic;
    langCode = codeLang;
    await sl<CacheHelper>().cacheLanguage(codeLang);
    emit(ChangeLangSucess());
  }

  void getCachedLang() {
    emit(ChangeLangLoading());
    final cachedLang = sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
    emit(ChangeLangSucess());
  }
}
