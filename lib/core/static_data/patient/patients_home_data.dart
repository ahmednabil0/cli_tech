import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/routes/app_routes.dart';

List patientData = [
  {
    'ar': 'رفع الوسائط',
    'en': 'Upload Media',
    'image': AppConstants.uploadMedia,
    'page': Routes.uploadPatientMedia
  },
  {
    'ar': 'معلومات الطبيب',
    'en': 'Doctor Info',
    'image': AppConstants.preservation,
    'page': Routes.doctorInfoPage
  },
  {
    'ar': 'معلوماتي',
    'en': 'My Info',
    'image': AppConstants.patientInfo,
    'page': Routes.patientInfo
  },
  {
    'ar': 'الغاء موعد',
    'en': 'Cancel Appointment',
    'image': AppConstants.cancelAppointment,
    'page': Routes.cancelApoointment
  },
  {
    'ar': 'سجلي الطبي',
    'en': 'Medical Record',
    'image': AppConstants.medicalRecord,
    'page': Routes.patientMediacalRecords
  },
];

Map otherPatientData = {
  'ar': 'حجز موعد',
  'en': 'Book Appointment',
  'image': AppConstants.bookAppointment,
  'page': Routes.bookAppointmentPage
};
