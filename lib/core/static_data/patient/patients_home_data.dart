import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/routes/app_routes.dart';

List patientData = [
  {
    'ar': 'رفع الوسائط',
    'en': 'Upload Media',
    'image': AppConstants.uploadMedia,
  },
  {
    'ar': 'معلومات الطبيب',
    'en': 'Doctor Info',
    'image': AppConstants.preservation,
  },
  {
    'ar': 'معلوماتي',
    'en': 'My Info',
    'image': AppConstants.patientInfo,
  },
  {
    'ar': 'الغاء موعد',
    'en': 'Cancel Appointment',
    'image': AppConstants.cancelAppointment,
  },
  {
    'ar': 'سجلي الطبي',
    'en': 'Medical Record',
    'image': AppConstants.medicalRecord,
  },
];

Map otherPatientData = {
  'ar': 'حجز موعد',
  'en': 'Book Appointment',
  'image': AppConstants.bookAppointment,
  'page': Routes.bookAppointmentPage
};
