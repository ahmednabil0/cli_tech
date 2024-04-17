import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/routes/app_routes.dart';

List doctorData = [
  {
    'ar': 'المواعيد',
    'en': 'Appointments',
    'image': AppConstants.calender,
    'page': Routes.apointmentsDoctor
  },
  {
    'ar': 'المرضى',
    'en': 'Patients',
    'image': AppConstants.personDH,
    'page': null
  },
  {
    'ar': 'الاستقبال',
    'en': 'Receptionist',
    'image': AppConstants.receptionist,
    'page': null
  },
  {
    'ar': 'الانتظار',
    'en': 'Pending',
    'image': AppConstants.pendingDH,
    'page': Routes.requestPage
  },
  {
    'ar': 'اضافة معلومات',
    'en': 'Add Data',
    'image': AppConstants.addData,
    'page': null
  },
];
