import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/features/auth/view/login_page.dart';
import 'package:gradution_project/features/auth/view/sign_up.dart';
import 'package:gradution_project/features/auth/view_model/login_cubit/logincubit_bloc.dart';
import 'package:gradution_project/features/auth/view_model/signup/signup_bloc.dart';
import 'package:gradution_project/features/intro/selct_role_page.dart';
import 'package:gradution_project/features/patient/appointments/view/screens/make_appointment_page.dart';
import 'package:gradution_project/features/patient/appointments/view/screens/sucess_book_pafe.dart';
import 'package:gradution_project/features/patient/appointments/view_model/appointment/appointment_bloc.dart';
import 'package:gradution_project/features/patient/home/view/screens/bottom_nav.dart';
import 'package:gradution_project/features/patient/home/view_model/cubit/home_cubit.dart';
import 'package:gradution_project/features/patient/pending_screen.dart';
import 'package:gradution_project/features/upload_media/view/screens/upload_media_page.dart';
import 'package:gradution_project/features/upload_media/view/screens/view_patient_media.dart';
import 'package:gradution_project/features/upload_media/view_model/upload_media/upload_media_bloc.dart';

import '../../features/intro/get_started_pages.dart';
import '../../features/intro/splash_page.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String getStartedPage = '/getStarted';
  static const String selectRolePage = '/selectRole';
  static const String loginPage = '/login';
  static const String signUpPage = '/signUp';
  static const String pendingPage = '/pending';
  static const String homePage = '/homePage';
  static const String bookAppointmentPage = '/bookAppointment';
  static const String scussesBookingPage = '/scussesBooking';
  static const String uploadPatientMedia = '/uploadPatientMedia';
  static const String viewPatientMedia = '/viewPatientMedia';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.intitlRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplasScreen(),
      //   );

      case Routes.getStartedPage:
        return MaterialPageRoute(
          builder: (_) => GetStarted(),
        );

      case Routes.selectRolePage:
        return MaterialPageRoute(
          builder: (_) => const RolePage(),
        );
      case Routes.pendingPage:
        final role = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => PendingPage(
            role: role,
          ),
        );

      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginPage(),
          ),
        );

      case Routes.signUpPage:
        final role = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<SignupBloc>(),
                  child: SignUpPage(
                    role: role,
                  ),
                ));
      // case Routes.homePage:
      case Routes.intitlRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<HomeCubit>(),
                  child: const PatientBottomNav(),
                ));
      case Routes.bookAppointmentPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<AppointmentCubit>()..initDisabledDays(),
            child: const BookAppointment(),
          ),
        );
      case Routes.scussesBookingPage:
        return MaterialPageRoute(
          builder: (_) => const SucessBooking(),
        );
      case Routes.uploadPatientMedia:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<UploadMediaBloc>(),
            child: const UploadPatientMediaPage(),
          ),
        );
      case Routes.viewPatientMedia:
        final context = routeSettings.arguments as BuildContext;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<UploadMediaBloc>(context),
            child: const ViewPatientMediaPage(),
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('Error Page'),
                  ),
                ));
    }
  }
}
