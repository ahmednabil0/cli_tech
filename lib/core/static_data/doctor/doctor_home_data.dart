import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/routes/app_routes.dart';

List doctorData = [
  {
    'ar': 'المواعيد',
    'en': 'Appointments',
    'image': AppConstants.calender,
    'page': null
  },
  {
    'ar': 'المرضى',
    'en': 'Patients',
    'image': AppConstants.personDH,
    'page': null
  },
  {
    'ar': 'الوصفة الطبية',
    'en': 'Prescription',
    'image': AppConstants.prescription,
    'page': Routes.prescriptionPage
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
    'page': null
  },
  {
    'ar': 'اضافة معلومات',
    'en': 'Add Data',
    'image': AppConstants.addData,
    'page': null
  },
];
