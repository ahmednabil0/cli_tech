import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/app_bloc/app/app_bloc.dart';
import 'package:gradution_project/core/services/services_locator.dart';

import '../core/routes/app_routes.dart';
import '../core/locale/app_locales.dart';
import '../core/theme/app_theme.dart';

class CliTech extends StatelessWidget {
  const CliTech({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AppCubit>()..getCachedLang(),
      child: ScreenUtilInit(
        builder: (context, child) {
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
      ),
    );
  }
}
