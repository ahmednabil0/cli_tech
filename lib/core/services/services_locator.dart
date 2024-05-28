import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gradution_project/core/app_bloc/app/app_bloc.dart';
import 'package:gradution_project/core/db/api/api_consumer.dart';
import 'package:gradution_project/core/db/api/dio_consumer.dart';
import 'package:gradution_project/features/auth/model/api_services/auth_sevices.dart';
import 'package:gradution_project/features/auth/model/repository/auth_repo.dart';
import 'package:gradution_project/features/auth/view_model/login_cubit/logincubit_bloc.dart';
import 'package:gradution_project/features/auth/view_model/signup/signup_bloc.dart';
import 'package:gradution_project/features/doctor/appointments/view_model/appointments_doctor/appointments_doctor_bloc.dart';
import 'package:gradution_project/features/doctor/complete_data/view_model/add_clinic_data/add_clinic_data_bloc.dart';
import 'package:gradution_project/features/doctor/doctor_patients/view_model.dart/doctor_patients/doctor_patients_bloc.dart';
import 'package:gradution_project/features/doctor/home/view_model/cubit/home_cubit.dart';
import 'package:gradution_project/features/doctor/home/view_model/home_doctor/home_doctor_bloc.dart';
import 'package:gradution_project/features/doctor/prescription/view_model/prescrption/prescrption_bloc.dart';
import 'package:gradution_project/features/doctor/request/view_model/doctor_pendings/doctor_pendings_bloc.dart';
import 'package:gradution_project/features/patient/appointments/view_model/appointment/appointment_bloc.dart';
import 'package:gradution_project/features/patient/chat_bot/view_model/patients_messages/patients_messages_bloc.dart';
import 'package:gradution_project/features/patient/home/view_model/cubit/home_cubit.dart';
import 'package:gradution_project/features/patient/pending/view_model/pending/pending_bloc.dart';
import 'package:gradution_project/features/patient/profile/view_model/PersonalInformation/personal_information_bloc.dart';
import 'package:gradution_project/features/patient/profile/view_model/setting_patient/setting_patient_bloc.dart';
import 'package:gradution_project/features/patient/upload_media/view_model/upload_media/upload_media_bloc.dart';
import '../db/cache/cache_helper.dart';

final sl = GetIt.instance;
void initServiceLoactor() {
  //! Whole project cubit
  sl.registerLazySingleton(() => AppCubit());

  //! features cubits
  sl.registerFactory(() => AuthApiServices());
  sl.registerFactory(() => AuthRepository(authApiServices: sl()));
  sl.registerFactory(() => LoginCubit(authRepo: sl()));

  sl.registerFactory(() => SignupBloc());
  sl.registerLazySingleton(() => HomeCubit());
  sl.registerFactory(() => AppointmentCubit());
  sl.registerFactory(() => UploadMediaBloc());
  sl.registerFactory(() => PersonalInformationBloc());
  sl.registerFactory(() => SettingPatientBloc());

  sl.registerLazySingleton(() => HomeDoctorCubit());
  sl.registerFactory(() => AddClinicDataBloc());
  sl.registerFactory(() => PendingBloc());
  sl.registerFactory(() => HomeDoctorBloc());
  sl.registerFactory(() => AppointmentsDoctorBloc());
  sl.registerFactory(() => PrescrptionBloc());
  sl.registerFactory(() => DoctorPatientsBloc());
  sl.registerFactory(() => DoctorPendingsBloc());
  sl.registerFactory(() => PatientsMessagesBloc());

  //! project
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => CacheHelper());
}
