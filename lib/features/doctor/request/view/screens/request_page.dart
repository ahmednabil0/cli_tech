import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/features/doctor/request/view/widgets/carousel_slider_request.dart';
import 'package:gradution_project/features/doctor/request/view_model/doctor_pendings/doctor_pendings_bloc.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'Pending Requests'),
      body: Background(
        child: BlocBuilder<DoctorPendingsBloc, DoctorPendingsState>(
          builder: (context, state) {
            return state == const DoctorPendingsState.loadInProgress()
                ? const Center(
                    child: SpinKitChasingDots(
                      color: AppColors.scColor,
                    ),
                  )
                : BlocProvider.of<DoctorPendingsBloc>(context)
                        .pendingUsers!
                        .isEmpty
                    ? Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        alignment: Alignment.center,
                        height: 100.h,
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
                          txt: 'You haven\'t any pending request.',
                          size: AppConstants.mediumText,
                          color: AppColors.redColor,
                          fw: FontWeight.w800,
                        ),
                      )
                    : CarouselSliderRequest(
                        data: BlocProvider.of<DoctorPendingsBloc>(context)
                            .pendingUsers!,
                        doctorPendingsBloc:
                            BlocProvider.of<DoctorPendingsBloc>(context),
                      );
          },
        ),
      ),
    );
  }
}
