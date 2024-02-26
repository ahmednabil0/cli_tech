import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/space.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:jiffy/jiffy.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({
    super.key,
    required this.role,
  });
  final String? role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HSizedBox(
              he: 20.h,
            ),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: AppColors.primaryColor,
                  )),
              child: appText(
                  txt: Jiffy.now().yMMMMEEEEdjm,
                  size: AppConstants.largeText,
                  fw: FontWeight.w600,
                  color: AppColors.primaryColor),
            ),
            HSizedBox(
              he: 15.h,
            ),
            SvgPicture.asset(
              AppConstants.pending,
              height: 300.h,
            ),
            HSizedBox(
              he: 15.h,
            ),
            appText(
              txt:
                  "Your request as a $role is pending until the doctor's approval",
              size: AppConstants.largeText,
              fw: FontWeight.w500,
              color: AppColors.fontColor,
            ),
            HSizedBox(
              he: 25.h,
            ),
            AppButton(
              txt: 'Try Again',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
