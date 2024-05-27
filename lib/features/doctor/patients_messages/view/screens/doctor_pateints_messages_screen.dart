import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:jiffy/jiffy.dart';

class DoctorPatientsMessage extends StatelessWidget {
  const DoctorPatientsMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        wi: true,
        title: 'Patients Messages',
        tcolor: AppColors.scColor,
      ),
      body: Background(
        child: SizedBox(
          child: ListView.builder(
            // physics: const ClampingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                color: AppColors.scColor.withOpacity(0.85),
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.r,
                            backgroundImage: const AssetImage(
                              AppConstants.doctorProfile,
                            ),
                          ),
                          5.wd(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText(
                                txt: 'Ahmed Nabil',
                                size: AppConstants.mediumText,
                                fw: FontWeight.w800,
                                color: AppColors.whiteColor,
                              ),
                              appText(
                                txt: Jiffy.now().yMMMMdjm,
                                size: AppConstants.smallText,
                                fw: FontWeight.w400,
                                color: AppColors.whiteColor.withOpacity(0.7),
                              ),
                            ],
                          )
                        ],
                      ),
                      10.he(),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.whiteColor),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: appText(
                          align: TextAlign.start,
                          txt: index.isEven
                              ? 'Are You Availble in clinic at 7:30 AM Tommorow '
                              : 'Hello Doctor Ahmed I Want To Show You My Lap Tests Results,Hello Doctor Ahmed I Want To Show You My Lap Tests Results,Hello Doctor Ahmed I Want To Show You My Lap Tests Results.',
                          size: AppConstants.smallText,
                          ml: 10,
                          fw: FontWeight.w500,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      // const Spacer(),
                      10.he(),
                      Row(
                        children: [
                          Expanded(
                              child: MyCustomTextField(
                            height: 38.h,
                            max: 10,
                            controller: TextEditingController(),
                            hint: 'Reply On Message.',
                          )),
                          Card(
                            color: AppColors.whiteColor,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.send_rounded,
                                size: 27.w,
                                color: AppColors.scColor,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
