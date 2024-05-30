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
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:gradution_project/features/patient/medical_records/view_model/patient_records/patient_records_bloc.dart';

class PatientMediacalRecordsPage extends StatelessWidget {
  const PatientMediacalRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Medical Records',
        context: context,
      ),
      body: Background(
          child: BlocBuilder<PatientRecordsBloc, PatientRecordsState>(
        builder: (context, state) {
          var bloc = BlocProvider.of<PatientRecordsBloc>(context);
          return Column(
            children: [
              15.he(),
              SizedBox(
                width: 310.w,
                child: MyCustomTextField(
                  controller: TextEditingController(),
                  hint: 'Search Here By Date',
                  icon: IconButton(
                    onPressed: () async {
                      await bloc.showDateTimePicker(context);
                    },
                    icon: Icon(
                      Icons.date_range_rounded,
                      color: AppColors.scColor,
                      size: 25.w,
                    ),
                  ),
                ),
              ),
              25.he(),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: appText(
                  txt: 'Recent Records:',
                  size: AppConstants.largeText,
                  fw: FontWeight.w600,
                ),
              ),
              Expanded(
                  child: state == const PatientRecordsState.loading()
                      ? const SpinKitCircle(
                          color: AppColors.scColor,
                        )
                      : BlocProvider.of<PatientRecordsBloc>(context)
                              .medicalRecords!
                              .isEmpty
                          ? Center(
                              child: appText(
                                txt: 'You Dont Have Any Record',
                                size: AppConstants.mediumText,
                                color: AppColors.hintColor,
                                fw: FontWeight.w500,
                              ),
                            )
                          : ListView.builder(
                              itemCount: bloc.medicalRecords!.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Card(
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
                                                        Icons
                                                            .date_range_outlined,
                                                        color:
                                                            AppColors.scColor,
                                                        size: 20.w,
                                                      ),
                                                      4.wd(),
                                                      appText(
                                                        txt:
                                                            'Date: ${bloc.medicalRecords![index]['date']}',
                                                        size: AppConstants
                                                            .mediumText,
                                                        fw: FontWeight.w500,
                                                        color:
                                                            AppColors.hintColor,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .medical_information,
                                                        color:
                                                            AppColors.scColor,
                                                        size: 20.w,
                                                      ),
                                                      4.wd(),
                                                      appText(
                                                        txt:
                                                            'Type:${bloc.medicalRecords![index]['type']}',
                                                        size: AppConstants
                                                            .mediumText,
                                                        fw: FontWeight.w500,
                                                        color:
                                                            AppColors.hintColor,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              CustomImage(
                                                h: 50.h,
                                                imgPath:
                                                    AppConstants.preservation,
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
                                                color: AppColors.redColor
                                                    .withOpacity(0.7),
                                                size: 20.w,
                                              ),
                                              4.wd(),
                                              Expanded(
                                                child: appText(
                                                  txt:
                                                      'Report: ${bloc.medicalRecords![index]['report']}',
                                                  size: AppConstants
                                                      .verySmallText,
                                                  fw: FontWeight.w600,
                                                  color: AppColors.redColor
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
                                              const Icon(
                                                Icons.access_time_rounded,
                                                color: AppColors.scColor,
                                              ),
                                              2.wd(),
                                              appText(
                                                txt: bloc.medicalRecords![index]
                                                    ['hour'],
                                                size: AppConstants.mediumText,
                                                color: AppColors.scColor,
                                                fw: FontWeight.w600,
                                              ),
                                              const Spacer(),
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
                                                        .medicalRecords![index],
                                                  );
                                                },
                                              ),
                                              // AppButton(
                                              //   w: 120.w,
                                              //   h: 30.h,
                                              //   color: AppColors.redColor
                                              //       .withOpacity(0.7),
                                              //   ts: AppConstants.nanoText + 1,
                                              //   tfw: FontWeight.w800,
                                              //   txt: 'Contact Doctor',
                                              //   onTap: () {},
                                              // )
                                            ],
                                          ),
                                          5.he(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ))
            ],
          );
        },
      )),
    );
  }
}
