import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';

class SucessBooking extends StatelessWidget {
  const SucessBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'success',
        context,
      ),
      body: Background(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppConstants.booked,
            height: 200.h,
            fit: BoxFit.cover,
          ),
          appText(
            ph: 10.h,
            txt: "your Apoointment is Booked successfully",
            size: AppConstants.largeText,
            color: AppColors.scColor,
            fw: FontWeight.w700,
          ),
          Table(
            border: TableBorder.all(
                color: AppColors.scColor,
                borderRadius: BorderRadius.circular(10.r)),
            children: [
              TableRow(children: [
                appText(
                  ph: 5.h,
                  txt: "Details: 2024/3/3 , 3.00 AM ,Retry",
                  size: AppConstants.mediumText,
                  color: AppColors.hintColor,
                  fw: FontWeight.w500,
                ),
              ])
            ],
          )
        ],
      )),
    );
  }
}
