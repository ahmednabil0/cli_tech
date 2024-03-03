import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gradution_project/core/app_bloc/app/app_bloc.dart';
import 'package:gradution_project/core/db/api/api_consumer.dart';
import 'package:gradution_project/core/db/api/dio_consumer.dart';
import 'package:gradution_project/features/auth/view_model/login_cubit/logincubit_bloc.dart';
import 'package:gradution_project/features/auth/view_model/signup/signup_bloc.dart';
import 'package:gradution_project/features/patient/appointments/view_model/appointment/appointment_bloc.dart';
import 'package:gradution_project/features/patient/home/view_model/cubit/home_cubit.dart';
import 'package:gradution_project/features/upload_media/view_model/upload_media/upload_media_bloc.dart';
import '../db/cache/cache_helper.dart';

final sl = GetIt.instance;
void initServiceLoactor() {
  //! Whole project cubit
  sl.registerLazySingleton(() => AppCubit());

  //! features cubits
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => SignupBloc());
  sl.registerFactory(() => HomeCubit());
  sl.registerFactory(() => AppointmentCubit());
  sl.registerFactory(() => UploadMediaBloc());

  //! project
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => CacheHelper());
}
