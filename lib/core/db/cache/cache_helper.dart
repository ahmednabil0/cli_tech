import 'dart:io';

import 'package:jiffy/jiffy.dart';
import 'package:shared_preferences/shared_preferences.dart';
//CacheHelper That's Connect and Talk to local database.

class CacheHelper {
  late SharedPreferences sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Jiffy.setLocale(sharedPreferences.getString('cachedCode') ?? 'ar');
  }

  Future<bool> setData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  bool containsKey({required String key}) {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  final String _cachedCode = "cachedCode";

  String getCachedLanguage() {
    final code = sharedPreferences.getString(_cachedCode);
    if (code != null) {
      return code;
    } else {
      return Platform.localeName.split('_')[0];
    }
  }

  Future<void> cacheLanguage(String code) async {
    await sharedPreferences.setString(_cachedCode, code);
  }
}
