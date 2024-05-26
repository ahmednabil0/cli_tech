import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
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
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:gradution_project/features/doctor/doctor_patients/view_model.dart/doctor_patients/doctor_patients_bloc.dart';

class DoctorPatientsPage extends StatelessWidget {
  const DoctorPatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'Patients'),
      body: Background(
          child: BlocBuilder<DoctorPatientsBloc, DoctorPatientsState>(
        builder: (context, state) {
          var bloc = BlocProvider.of<DoctorPatientsBloc>(context);
          return Column(
            children: [
              MyCustomTextField(
                width: double.infinity,
                controller: bloc.searchContrller,
                hint: 'Search By Patient Name...',
                onChanged: (value) async {
                  EasyDebounce.debounce('one', Durations.medium1, () async {
                    await bloc.getDoctorPatients(value);
                  });
                },
                icon: IconButton(
                  onPressed: () async {
                    EasyDebounce.debounce('one', Durations.medium1, () async {
                      await bloc.getDoctorPatients(bloc.searchContrller.text);
                    });
                  },
                  icon: Icon(
                    Icons.search_rounded,
                    color: AppColors.scColor,
                    size: AppConstants.extraText,
                  ),
                ),
              ),
              15.he(),
              state == const DoctorPatientsState.loadingData()
                  ? const Expanded(
                      child: Center(
                        child: SpinKitChasingDots(
                          color: AppColors.scColor,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Card(
                            color: AppColors.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15.r,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Column(children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    bloc.patients![index]['photo'] == null
                                        ? Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                    AppConstants.imagePicker,
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                            width: 60.w,
                                            height: 60.h,
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          bloc.patients![index]
                                                              ['photo']),
                                                  fit: BoxFit.cover),
                                            ),
                                            width: 60.w,
                                            height: 60.h,
                                          ),
                                    10.wd(),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          appText(
                                            txt:
                                                'Name: ${bloc.patients![index]['name']}',
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
                                                txt:
                                                    ' Age:${bloc.patients![index]['age'] ?? 22}',
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
                                                txt: bloc.patients![index]
                                                    ['phone'],
                                                size: AppConstants.mediumText,
                                                color: AppColors.hintColor,
                                                fw: FontWeight.w600,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                10.he(),
                                appText(
                                  align: TextAlign.start,
                                  txt:
                                      'Report:${bloc.patients![index]['report'] ?? 'No Report'}',
                                  size: AppConstants.smallText,
                                  ml: 5,
                                  of: TextOverflow.ellipsis,
                                  color: AppColors.redColor.withOpacity(0.7),
                                  fw: FontWeight.w400,
                                ),
                                5.he(),
                                AppButton(
                                  txt: 'View Medical Rewcords',
                                  onTap: () {
                                    navigate(
                                        context: context,
                                        route: Routes.patientRecordsPage,
                                        args: bloc.patients![index]);
                                  },
                                  w: double.infinity,
                                )
                              ]),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => 10.he(),
                        itemCount: BlocProvider.of<DoctorPatientsBloc>(context)
                            .patients!
                            .length,
                      ),
                    )
            ],
          );
        },
      )),
    );
  }
}
