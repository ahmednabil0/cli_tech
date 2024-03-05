import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:gradution_project/features/patient/upload_media/view_model/upload_media/upload_media_bloc.dart';

class UploadPatientMediaPage extends StatelessWidget {
  const UploadPatientMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Upload Media', context: context),
      body: Background(child: BlocBuilder<UploadMediaBloc, UploadMediaState>(
        builder: (context, state) {
          return Column(
            children: [
              15.he(),
              SizedBox(
                width: 310.w,
                child: MyCustomTextField(
                  controller: TextEditingController(),
                  hint: 'Search Here By Date',
                  icon: Icon(
                    Icons.date_range_rounded,
                    color: AppColors.scColor,
                    size: 25.w,
                  ),
                ),
              ),
              25.he(),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: appText(
                  txt: 'Recent:',
                  size: AppConstants.largeText,
                  fw: FontWeight.w600,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => navigate(
                      context: context,
                      route: Routes.viewPatientMedia,
                      args: context,
                    ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  txt: 'Date: 2024/03/3',
                                  size: AppConstants.mediumText,
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
                                      'Type: ${index.isEven ? 'Exmanations' : 'Retry'}',
                                  size: AppConstants.mediumText,
                                  fw: FontWeight.w500,
                                  color: AppColors.hintColor,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.drive_folder_upload_rounded,
                                  color: AppColors.scColor,
                                  size: 20.w,
                                ),
                                4.wd(),
                                appText(
                                  txt: 'Required:',
                                  size: AppConstants.mediumText,
                                  fw: FontWeight.w500,
                                  color: AppColors.hintColor,
                                ),
                              ],
                            ),
                            Wrap(
                              // alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: 10.w,
                              children: List.generate(
                                  index.isOdd ? 3 : 2,
                                  (index) => SizedBox(
                                        child: Chip(
                                          labelPadding: const EdgeInsets.all(0),
                                          avatar: Icon(
                                            index.isEven
                                                ? Icons.check_box_rounded
                                                : Icons
                                                    .drive_folder_upload_rounded,
                                            color: AppColors.whiteColor,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          backgroundColor: index.isEven
                                              ? AppColors.scColor
                                              : AppColors.redColor,
                                          label: appText(
                                            txt: index.isEven
                                                ? "CRC"
                                                : "Blood GRT",
                                            size: AppConstants.smallText,
                                            fw: FontWeight.w500,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      )),
                            )
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
