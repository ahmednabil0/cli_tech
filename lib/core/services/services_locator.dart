import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gradution_project/core/db/api/api_consumer.dart';
import 'package:gradution_project/core/db/api/dio_consumer.dart';
import 'package:gradution_project/features/auth/view_model/login_cubit/login_cubit_cubit.dart';
import 'package:gradution_project/features/auth/view_model/sign_up_cubit/sign_up_cubit.dart';
import '../app_bloc/app_bloc_cubit.dart';
import '../db/cache/cache_helper.dart';

final sl = GetIt.instance;
void initServiceLoactor() {
  sl.registerLazySingleton(() => AppBlocCubit());

  sl.registerLazySingleton(() => CacheHelper());
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => SignUpCubit());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}
