import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/features/auth/view/login_page.dart';
import 'package:gradution_project/features/auth/view/sign_up.dart';
import 'package:gradution_project/features/auth/view_model/login_cubit/logincubit_bloc.dart';
import 'package:gradution_project/features/auth/view_model/signup/signup_bloc.dart';
import 'package:gradution_project/features/doctor/appointments/view_model/appointments_doctor/appointments_doctor_bloc.dart';
import 'package:gradution_project/features/doctor/complete_data/view/screens/complete_clinic_data.dart';
import 'package:gradution_project/features/doctor/complete_data/view_model/add_clinic_data/add_clinic_data_bloc.dart';
import 'package:gradution_project/features/doctor/doctor_patients/view/screens/doctor_patients_page.dart';
import 'package:gradution_project/features/doctor/doctor_patients/view/screens/pateint_records_page.dart';
import 'package:gradution_project/features/doctor/home/view/screens/bottom_nav.dart';
import 'package:gradution_project/features/doctor/home/view_model/cubit/home_cubit.dart';
import 'package:gradution_project/features/doctor/appointments/view/screens/apointments_doctor_page.dart';
import 'package:gradution_project/features/doctor/prescription/view_model/prescrption/prescrption_bloc.dart';
import 'package:gradution_project/features/doctor/request/view/screens/request_page.dart';
import 'package:gradution_project/features/intro/selct_role_page.dart';
import 'package:gradution_project/features/intro/splash_page.dart';
import 'package:gradution_project/features/patient/chat_bot/view/screens/chat_page.dart';
import 'package:gradution_project/features/patient/medical_records/view/screens/patient_recods_page.dart';
import 'package:gradution_project/features/patient/appointments/view/screens/cancel_appointment.dart';
import 'package:gradution_project/features/patient/appointments/view/screens/make_appointment_page.dart';
import 'package:gradution_project/features/patient/appointments/view/screens/sucess_book_pafe.dart';
import 'package:gradution_project/features/patient/appointments/view_model/appointment/appointment_bloc.dart';
import 'package:gradution_project/features/patient/doctor_info/view/screens/doctor_info_page.dart';
import 'package:gradution_project/features/patient/home/view/screens/bottom_nav.dart';
import 'package:gradution_project/features/patient/home/view_model/cubit/home_cubit.dart';
import 'package:gradution_project/features/patient/medical_records/view/screens/view_mediacal_record_page.dart';
import 'package:gradution_project/features/patient/notification/view/screens/notification_page.dart';
import 'package:gradution_project/features/patient/pending/view/pending_screen.dart';
import 'package:gradution_project/features/patient/patient_info/view/screens/patient_info.dart';
import 'package:gradution_project/features/patient/pending/view_model/pending/pending_bloc.dart';
import 'package:gradution_project/features/patient/profile/view/screens/doctor_profile_page.dart';
import 'package:gradution_project/features/patient/profile/view/screens/id_info_patient_page.dart';
import 'package:gradution_project/features/patient/profile/view/screens/patient_profile_page.dart';
import 'package:gradution_project/features/patient/profile/view/screens/personal_info_doctor.dart';
import 'package:gradution_project/features/patient/profile/view/screens/personal_info_patient.dart';
import 'package:gradution_project/features/patient/profile/view/screens/setting_patient_page.dart';
import 'package:gradution_project/features/patient/profile/view_model/PersonalInformation/personal_information_bloc.dart';
import 'package:gradution_project/features/patient/profile/view_model/setting_patient/setting_patient_bloc.dart';
import 'package:gradution_project/features/patient/upload_media/view/screens/upload_media_page.dart';
import 'package:gradution_project/features/patient/upload_media/view/screens/view_patient_media.dart';
import 'package:gradution_project/features/patient/upload_media/view_model/upload_media/upload_media_bloc.dart';

import '../../features/doctor/prescription/view/screens/prescription_page.dart';
import '../../features/intro/get_started_pages.dart';
// import '../../features/intro/splash_page.dart';

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
  static const String doctorInfoPage = '/doctorInfoPage';
  static const String patientInfo = '/patientInfo';
  static const String cancelApoointment = '/cancelApoointment';
  static const String patientMediacalRecords = '/patientMediacalRecords';
  static const String viewPatientMedicalRrcord = '/viewPatientMedicalRrcord';
  static const String chatBotPatient = '/chatBotPatient';
  static const String notificationPatient = '/notificationPatient';
  static const String profilePatient = '/profilePatient';
  static const String personalInfoPatient = '/personalInfoPatient';
  static const String settingsPatient = '/settingsPatient';
  static const String idInfoPage = '/idInfoPage';

  //! Doctor
  static const String doctorHomePage = '/doctorHomePage';
  static const String doctorPrifilePage = '/doctorProfilePage';
  static const String prescriptionPage = '/prescriptionPage';
  static const String requestPage = '/requestPage';
  static const String apointmentsDoctor = '/apointmentsDoctor';
  static const String doctorPatientsPage = '/doctorPatientsPage';
  static const String patientRecordsPage = '/patientRecordsPage';
  static const String addClinicData = '/addClinicData';
  static const String personalInfoDoctor = '/personalInfoDoctor';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(
          builder: (_) => const SplasScreen(),
        );

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
          builder: (_) => BlocProvider(
            create: (context) => PendingBloc(),
            child: PendingPage(
              role: role,
            ),
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
      case Routes.homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<HomeCubit>(),
                  child: const PatientBottomNav(),
                ));
      case Routes.bookAppointmentPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<AppointmentCubit>()..getTodayData(),
            child: const BookAppointment(),
          ),
        );
      case Routes.scussesBookingPage:
        final data = routeSettings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => SucessBooking(
            data: data,
          ),
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
      case Routes.doctorInfoPage:
        return MaterialPageRoute(
          builder: (_) => const DoctorInfoPage(),
        );

      case Routes.patientInfo:
        return MaterialPageRoute(
          builder: (_) => const PatientInfoPage(),
        );
      case Routes.cancelApoointment:
        return MaterialPageRoute(
          builder: (_) => const CancelAppointMentPatient(),
        );
      case Routes.patientMediacalRecords:
        return MaterialPageRoute(
          builder: (_) => const PatientMediacalRecordsPage(),
        );
      case Routes.viewPatientMedicalRrcord:
        return MaterialPageRoute(
          builder: (_) => const ViewPatientMedicalRrcordPage(),
        );
      case Routes.chatBotPatient:
        return MaterialPageRoute(
          builder: (_) => const ChatBotPage(),
        );
      case Routes.notificationPatient:
        return MaterialPageRoute(
          builder: (_) => const NotificationPatientPage(),
        );
      case Routes.profilePatient:
        final wi = routeSettings.arguments as bool;

        return MaterialPageRoute(
          builder: (_) => ProfilePatientPage(
            wi: wi,
          ),
        );

      case Routes.personalInfoPatient:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<PersonalInformationBloc>()..getData(),
                  child: const PersonalInfoPatientPage(),
                ));
      case Routes.settingsPatient:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<SettingPatientBloc>()..initLangSetings(),
            child: const SettingsPatientPage(),
          ),
        );

      case Routes.idInfoPage:
        return MaterialPageRoute(
          builder: (_) => const IdInformationAndMedicalRecordsPatientPage(),
        );

      //! Doctor Module
      case Routes.doctorHomePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<HomeDoctorCubit>(),
                  child: const DoctorBottomNav(),
                ));
      case Routes.doctorPrifilePage:
        final wi = routeSettings.arguments as bool;
        return MaterialPageRoute(
          builder: (_) => DoctorProfilePage(
            wi: wi,
          ),
        );

      case Routes.prescriptionPage:
        final parms = routeSettings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<PrescrptionBloc>(),
            child: PrescriptionPage(
              data: parms,
            ),
          ),
        );
      case Routes.requestPage:
        return MaterialPageRoute(
          builder: (_) => const RequestPage(),
        );

      case Routes.apointmentsDoctor:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<AppointmentsDoctorBloc>()..getData(),
            child: DoctorAppointmentPage(),
          ),
        );
      case Routes.doctorPatientsPage:
        return MaterialPageRoute(
          builder: (_) => const DoctorPatientsPage(),
        );

      case Routes.patientRecordsPage:
        return MaterialPageRoute(
          builder: (_) => const PatientRecordsPage(),
        );

      case Routes.addClinicData:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<AddClinicDataBloc>()..getCLinicData(),
            child: const CompleteClinicData(),
          ),
        );
      case Routes.personalInfoDoctor:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<PersonalInformationBloc>()..getData(),
                  child: const PersonalInfoDoctorPage(),
                ));

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
