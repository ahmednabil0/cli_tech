import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';

import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';

class NotificationPatientPage extends StatelessWidget {
  const NotificationPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Notification',
        wi: true,
      ),
      body: Background(
        pad: 5.w,
        child: ListView.builder(
          itemCount: 6,
          padding: EdgeInsets.only(
            top: 10.h,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.scColor,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              title: appText(
                align: TextAlign.start,
                txt: 'Doctor Ali hamed',
                color: AppColors.scColor,
                size: AppConstants.mediumText,
                fw: FontWeight.w600,
              ),
              subtitle: appText(
                align: TextAlign.start,
                txt: 'Two Lap Tests Is Required [CBC, BLOOD SUGAR, URINALYSIS]',
                color: AppColors.hintColor,
                ml: 2,
                size: AppConstants.smallText,
                fw: FontWeight.w400,
              ),
              trailing: Icon(
                Icons.arrow_forward_rounded,
                size: AppConstants.ultraText + 5,
              ),
              onTap: () {
                // Handle notification tap
              },
            );
          },
        ),
      ),
    );
  }
}
