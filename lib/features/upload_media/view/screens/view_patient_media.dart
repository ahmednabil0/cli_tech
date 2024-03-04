import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/features/upload_media/view_model/upload_media/upload_media_bloc.dart';

class ViewPatientMediaPage extends StatelessWidget {
  const ViewPatientMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: '2024/03/3', context: context),
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
                          txt: 'Type: Exmanations',
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
                          txt: 'Required: [ 3 ]',
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
                  child: ListView.builder(
                    itemCount: 3,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Chip(
                                  labelPadding: const EdgeInsets.all(0),
                                  avatar: Icon(
                                    Icons.drive_folder_upload_rounded,
                                    color: AppColors.whiteColor,
                                  ),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  backgroundColor: AppColors.redColor,
                                  label: appText(
                                    txt: index == 2
                                        ? "BCB V2"
                                        : index.isEven
                                            ? 'Blood A GTR'
                                            : "CRV",
                                    color: AppColors.whiteColor,
                                    size: AppConstants.mediumText,
                                  ),
                                ),
                                state.maybeWhen(
                                  orElse: () => Expanded(
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
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                await BlocProvider.of<
                                                            UploadMediaBloc>(
                                                        context)
                                                    .openFilePicker(index);
                                              },
                                              icon: Icon(
                                                Icons
                                                    .drive_folder_upload_rounded,
                                                color: AppColors.scColor,
                                                size: 30.w,
                                              ),
                                            ),
                                            appText(
                                              txt: 'Upload Files From Device',
                                              size: AppConstants.smallText,
                                              fw: FontWeight.w500,
                                              color: AppColors.scColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  uploadedMedia: (int i) => index == i
                                      ? Center(
                                          child: DottedBorder(
                                            color: AppColors.scColor,
                                            strokeWidth: 2,
                                            dashPattern: const [10, 5],
                                            radius: Radius.circular(10.r),
                                            borderType: BorderType.RRect,
                                            child: Padding(
                                              padding: EdgeInsets.all(5.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.scColor
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5,
                                                      ),
                                                    ),
                                                    width: 75.w,
                                                    height: 60.h,
                                                    child: Stack(
                                                      children: [
                                                        PDFView(
                                                          filePath: BlocProvider
                                                                  .of<UploadMediaBloc>(
                                                                      context)
                                                              .filePath!,
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          left: 0,
                                                          right: 0,
                                                          child: AppButton(
                                                            w: 75.w,
                                                            h: 20.h,
                                                            r: 2.r,
                                                            txt: 'Upload',
                                                            ts: AppConstants
                                                                .nanoText,
                                                            tfw:
                                                                FontWeight.w700,
                                                            onTap: () {},
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
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
                                                                  index);
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
                                                ],
                                              ),
                                            ),
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
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      await BlocProvider.of<
                                                                  UploadMediaBloc>(
                                                              context)
                                                          .openFilePicker(
                                                              index);
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .drive_folder_upload_rounded,
                                                      color: AppColors.scColor,
                                                      size: 30.w,
                                                    ),
                                                  ),
                                                  appText(
                                                    txt:
                                                        'Upload Files From Device',
                                                    size:
                                                        AppConstants.smallText,
                                                    fw: FontWeight.w500,
                                                    color: AppColors.scColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                )
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
