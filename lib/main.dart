import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_project/core/app_bloc/bloc_observer.dart';
import 'app/clitech.dart';
import 'core/db/cache/cache_helper.dart';
import 'core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  initServiceLoactor();
  await sl<CacheHelper>().init();

  runApp(
    const CliTech(),
  );
}
// ahmed updaated
