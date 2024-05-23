import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/images/custom_image.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/features/doctor/appointments/view/screens/apointments_doctor_page.dart';
import 'package:gradution_project/features/doctor/doctor_patients/view_model.dart/doctor_patients/doctor_patients_bloc.dart';

class PatientRecordsPage extends StatelessWidget {
  const PatientRecordsPage({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: data['name'],
      ),
      body: Background(
        child: Column(
          children: [
            15.he(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(data['photo']),
                        fit: BoxFit.cover),
                  ),
                  width: 100.w,
                  height: 100.h,
                ),
                10.wd(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                        txt: 'Name: ${data['name']}',
                        size: AppConstants.largeText,
                        fw: FontWeight.w700,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_rounded,
                            color: AppColors.hintColor,
                          ),
                          appText(
                            txt: ' Age:  ${data['age'] ?? 21}',
                            size: AppConstants.mediumText,
                            color: AppColors.hintColor,
                            fw: FontWeight.w600,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_android_rounded,
                            color: AppColors.hintColor,
                          ),
                          appText(
                            txt: data['phone'],
                            size: AppConstants.mediumText,
                            color: AppColors.hintColor,
                            fw: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            25.he(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: appText(
                txt: 'Patient Report',
                size: AppConstants.mediumText,
                fw: FontWeight.w700,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      AppConstants.bkImage,
                    ),
                    opacity: 0.3,
                    fit: BoxFit.cover),
                color: AppColors.scColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: AppColors.scColor,
                ),
              ),
              child: appText(
                align: TextAlign.start,
                txt: data['report'],
                size: AppConstants.mediumText,
                ml: 5,
                of: TextOverflow.ellipsis,
                color: AppColors.scColor.withOpacity(0.7),
                fw: FontWeight.w500,
              ),
            ),
            15.he(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: appText(
                txt: 'Patient Records',
                size: AppConstants.mediumText,
                fw: FontWeight.w700,
              ),
            ),
            BlocBuilder<DoctorPatientsBloc, DoctorPatientsState>(
              builder: (context, state) {
                var bloc = BlocProvider.of<DoctorPatientsBloc>(context);
                return Expanded(
                    child: state == const DoctorPatientsState.loadingData()
                        ? const Center(
                            child: SpinKitCircle(
                              color: AppColors.scColor,
                            ),
                          )
                        : ListView.builder(
                            itemCount: bloc.medicalRecords!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 0.3,
                                borderOnForeground: true,
                                color: AppColors.whiteColor,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 8.h,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.date_range_outlined,
                                                    color: AppColors.scColor,
                                                    size: 20.w,
                                                  ),
                                                  4.wd(),
                                                  appText(
                                                    txt:
                                                        'Date: ${bloc.medicalRecords![index]['date']}',
                                                    size:
                                                        AppConstants.mediumText,
                                                    fw: FontWeight.w500,
                                                    color: AppColors.hintColor,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.medical_information,
                                                    color: AppColors.scColor,
                                                    size: 20.w,
                                                  ),
                                                  4.wd(),
                                                  appText(
                                                    txt:
                                                        'Type: ${bloc.medicalRecords![index]['type']}',
                                                    size:
                                                        AppConstants.mediumText,
                                                    fw: FontWeight.w500,
                                                    color: AppColors.hintColor,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          CustomImage(
                                            h: 50.h,
                                            imgPath: AppConstants.preservation,
                                          )
                                        ],
                                      ),
                                      5.he(),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.edit_document,
                                            color: AppColors.primaryColor
                                                .withOpacity(0.7),
                                            size: 20.w,
                                          ),
                                          4.wd(),
                                          Expanded(
                                            child: appText(
                                              txt:
                                                  'Report: ${bloc.medicalRecords![index]['report']}',
                                              size: AppConstants.verySmallText,
                                              fw: FontWeight.w600,
                                              color: AppColors.primaryColor
                                                  .withOpacity(0.7),
                                              of: TextOverflow.ellipsis,
                                              ml: 3,
                                              align: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                      5.he(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          AppButton(
                                            w: 120.w,
                                            h: 30.h,
                                            ts: AppConstants.nanoText + 1,
                                            tfw: FontWeight.w800,
                                            txt: 'View Details',
                                            onTap: () {
                                              navigate(
                                                  context: context,
                                                  route: Routes
                                                      .viewPatientMedicalRrcord,
                                                  args: bloc
                                                      .medicalRecords![index]);
                                            },
                                          ),
                                          AppButton(
                                            w: 120.w,
                                            h: 30.h,
                                            border: true,
                                            color: AppColors.primaryColor,
                                            ts: AppConstants.nanoText + 1,
                                            tfw: FontWeight.w800,
                                            txt: 'Contact Doctor',
                                            onTap: () {},
                                          )
                                        ],
                                      ),
                                      5.he(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ));
              },
            )
          ],
        ),
      ),
    );
  }
}
