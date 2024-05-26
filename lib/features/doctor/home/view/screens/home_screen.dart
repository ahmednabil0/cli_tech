import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/static_data/doctor/doctor_home_data.dart';
import 'package:gradution_project/features/doctor/home/view/widgets/carousel_slider_home.dart';
import 'package:gradution_project/features/doctor/home/view_model/home_doctor/home_doctor_bloc.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/db/cache/cache_helper.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/navigate.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/widgets/images/custom_image.dart';
import '../../../../../core/widgets/images/profile_image.dart';
import '../../../../../core/widgets/sized_box.dart';
import '../../../../../core/widgets/space.dart';
import '../../../../../core/widgets/text.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Background(
        child: Column(
          children: [
            BlocBuilder<HomeDoctorBloc, HomeDoctorState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        appText(
                          txt: "Upcoming Schedule",
                          size: AppConstants.largeText,
                          fw: FontWeight.w600,
                        ),
                        8.wd(),
                        CircleAvatar(
                          backgroundColor: AppColors.scColor,
                          radius: 14.r,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: appText(
                              txt: state == const HomeDoctorState.dataLoaded()
                                  ? BlocProvider.of<HomeDoctorBloc>(context)
                                      .todayAppointments!
                                      .length
                                      .toString()
                                  : '0',
                              size: AppConstants.mediumText,
                              color: AppColors.whiteColor,
                              fw: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    HSizedBox(
                      he: 8.h,
                    ),
                    state.when(
                        dataLoading: () => const Center(
                              child: SpinKitHourGlass(
                                color: AppColors.scColor,
                              ),
                            ),
                        dataError: () => const SizedBox(),
                        initial: () => const SizedBox(),
                        dataLoaded: () => InkWell(
                            onTap: () => navigate(
                                  context: context,
                                  route: Routes.apointmentsDoctor,
                                ),
                            child: BlocProvider.of<HomeDoctorBloc>(context)
                                    .todayAppointments!
                                    .isEmpty
                                ? Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    height: 130.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      border: Border.all(
                                        color: AppColors.scColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: appText(
                                      ph: 20.h,
                                      pw: 20,
                                      ml: 3,
                                      txt:
                                          'You Haven\'t Any Appointments Today.',
                                      size: AppConstants.mediumText,
                                      color: AppColors.redColor,
                                      fw: FontWeight.w800,
                                    ),
                                  )
                                : CarouselSliderHome(
                                    count:
                                        BlocProvider.of<HomeDoctorBloc>(context)
                                            .todayAppointments!
                                            .length,
                                    data:
                                        BlocProvider.of<HomeDoctorBloc>(context)
                                            .todayAppointments!,
                                  ))),
                  ],
                );
              },
            ),
            10.he(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: appText(
                txt: 'Services:',
                size: AppConstants.largeText,
                color: AppColors.fontColor,
                fw: FontWeight.w900,
              ),
            ),
            2.he(),
            Expanded(
              child: GridView.builder(
                itemCount: doctorData.length,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 2.82,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 5.h,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => navigate(
                      context: context,
                      route: doctorData[index]['page'],
                    ),
                    child: Card(
                      color: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColors.scColor.withOpacity(0.035),
                          width: 10,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.r),
                        ),
                      ),
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.w),
                            child: CustomImage(
                              imgPath: doctorData[index]['image'],
                              // w: 50.w,
                              h: 35.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          appText(
                            ph: 5.h,
                            pw: 5.w,
                            txt: doctorData[index]
                                [sl<CacheHelper>().getCachedLanguage()],
                            size: AppConstants.mediumText,
                            fw: FontWeight.w700,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 80.w,
      toolbarHeight: 60.h,
      leading: CustomImage(
        h: 100.h,
        imgPath: AppConstants.appLogo,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SizedBox(
            width: 50,
            height: 50,
            child: InkWell(
              onTap: () {
                navigate(
                  context: context,
                  route: Routes.doctorPrifilePage,
                  args: false,
                );
              },
              child: CustomAvatarImage(
                image: sl<CacheHelper>().containsKey(key: 'photo')
                    ? sl<CacheHelper>().getData(key: 'photo')
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
