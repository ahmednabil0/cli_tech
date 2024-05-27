import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/app_bloc/app/app_bloc.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/features/doctor/home/view_model/cubit/home_cubit.dart';
import 'package:gradution_project/features/patient/chat_bot/view_model/patients_messages/patients_messages_bloc.dart';
import 'package:gradution_project/features/patient/home/view_model/cubit/home_cubit.dart';
import 'package:gradution_project/features/patient/pending/view_model/pending/pending_bloc.dart';

import '../core/routes/app_routes.dart';
import '../core/locale/app_locales.dart';
import '../core/theme/app_theme.dart';

class CliTech extends StatelessWidget {
  const CliTech({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (BuildContext context) => sl<AppCubit>()..getCachedLang(),
        ),
        BlocProvider<HomeDoctorCubit>(
          create: (BuildContext context) => sl<HomeDoctorCubit>(),
        ),
        BlocProvider<PendingBloc>(
          create: (BuildContext context) => sl<PendingBloc>(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => sl<HomeCubit>(),
        ),
        BlocProvider<PatientsMessagesBloc>(
          create: (BuildContext context) =>
              sl<PatientsMessagesBloc>()..getMyMessages(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return MaterialApp(
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  AppLocalizations.delegate
                ],
                supportedLocales: const [
                  Locale('ar', "EG"),
                  Locale('en', "US"),
                ],
                locale: Locale(BlocProvider.of<AppCubit>(context).langCode),
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.intitlRoute,
                onGenerateRoute: AppRoutes.generateRoute,
                title: 'Cli Tech App',
                theme: getThemeDate(),
              );
            },
          );
        },
      ),
    );
  }
}
