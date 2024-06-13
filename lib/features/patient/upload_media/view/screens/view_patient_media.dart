import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/features/patient/upload_media/view_model/upload_media/upload_media_bloc.dart';

class ViewPatientMediaPage extends StatelessWidget {
  const ViewPatientMediaPage({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: data['date'], context: context),
      body: Background(
        child: Column(
          children: [
            15.he(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: appText(
                txt: 'Details:',
                size: AppConstants.largeText,
                fw: FontWeight.w600,
              ),
            ),
            Card(
              elevation: 0.2,
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
                          txt: 'Date: ${data['date']}',
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
                          txt: 'Type: ${data['type']}',
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
                          txt: 'Required: [ ${data['required_tests'].length} ]',
                          size: AppConstants.mediumText,
                          fw: FontWeight.w500,
                          color: AppColors.hintColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            15.he(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: appText(
                txt: 'Required:',
                size: AppConstants.largeText,
                fw: FontWeight.w600,
                color: AppColors.redColor,
              ),
            ),
            BlocBuilder<UploadMediaBloc, UploadMediaState>(
              builder: (context, state) {
                return Expanded(
                  child: data['required_tests'].length == 0
                      ? const SizedBox.shrink()
                      : ListView.builder(
                          itemCount: data['required_tests'].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 7.h),
                              child: Container(
                                width: double.infinity,
                                height: 130.h,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 8.h,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Chip(
                                        labelPadding: const EdgeInsets.all(0),
                                        avatar: data[data] != null
                                            ? Icon(
                                                Icons
                                                    .drive_folder_upload_rounded,
                                                color: AppColors.scColor,
                                                size: 30.w,
                                              )
                                            : Icon(
                                                Icons
                                                    .drive_folder_upload_rounded,
                                                color: AppColors.whiteColor,
                                              ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        backgroundColor: AppColors.redColor,
                                        label: appText(
                                          txt: data['required_tests'][index],
                                          color: AppColors.whiteColor,
                                          size: AppConstants.mediumText,
                                        ),
                                      ),
                                      state ==
                                              const UploadMediaState
                                                  .uploadingMedia(0)
                                          ? const Center(
                                              child: SpinKitCircle(
                                                color: AppColors.scColor,
                                              ),
                                            )
                                          : Expanded(
                                              child: DottedBorder(
                                                color: AppColors.scColor,
                                                strokeWidth: 2,
                                                dashPattern: const [10, 5],
                                                radius: Radius.circular(10.r),
                                                borderType: BorderType.RRect,
                                                child: SizedBox(
                                                  height: 100.h,
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () async {
                                                          await BlocProvider.of<
                                                                      UploadMediaBloc>(
                                                                  context)
                                                              .openFilePicker(
                                                                  index,
                                                                  data['required_tests']
                                                                      [index],
                                                                  data['id'],
                                                                  data,
                                                                  context);
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .drive_folder_upload_rounded,
                                                          color:
                                                              AppColors.scColor,
                                                          size: 30.w,
                                                        ),
                                                      ),
                                                      appText(
                                                        txt:
                                                            'Upload Files From Device',
                                                        size: AppConstants
                                                            .smallText,
                                                        fw: FontWeight.w500,
                                                        color:
                                                            AppColors.scColor,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
