import 'package:flutter/material.dart';
import 'app/clitech.dart';
import 'core/db/cache/cache_helper.dart';
import 'core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // print(Platform.localeName.split('_')[0]);

  initServiceLoactor();
  await sl<CacheHelper>().init();

  runApp(
    const CliTech(),
  );
}
// ahmed updaated