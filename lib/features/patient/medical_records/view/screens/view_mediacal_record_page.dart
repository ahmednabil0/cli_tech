import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/widgets.dart' as pw;

class ViewPatientMedicalRrcordPage extends StatefulWidget {
  const ViewPatientMedicalRrcordPage({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<ViewPatientMedicalRrcordPage> createState() =>
      _ViewPatientMedicalRrcordPageState();
}

class _ViewPatientMedicalRrcordPageState
    extends State<ViewPatientMedicalRrcordPage> {
  final ScreenshotController screenshotController = ScreenshotController();

  pw.Document? file;

  Future<void> convertToPdf() async {
    screenshotController.capture().then((capturedImage) async {
      // print(capturedImage);
      // print('0000000000000000000');
      if (capturedImage != null) {
        await exportedPdf(capturedImage);
      }
    });
  }

  Future<void> exportedPdf(Uint8List imageBytes) async {
    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Expanded(
            child: pw.Center(
                child: pw.Image(pw.MemoryImage(imageBytes),
                    fit: pw.BoxFit.contain)),
          );
        },
      ),
    );
    // try {
    //   // if (status == PermissionStatus.granted) {
    //   //   print('finalllllllllllllllllly');
    //   // }
    //   final output = await getTemporaryDirectory();
    //   File pdfFile = File('${output.path}/${_getRandomString(10)}.pdf');
    //   await pdfFile.writeAsBytes(await pdf.save());
    // } catch (e) {
    //   print(e.toString());
    //   print('sssssssssssssssssssssssssss');
    // }
    file = pdf;
    setState(() {});

    // Perform any further actions with the generated PDF file as desired.
  }

  List<Map<dynamic, dynamic>> drugs = [];
  @override
  void initState() {
    if (widget.data['drugs'] != null) {
      drugs = (widget.data['drugs'] as List)
          .map((element) => element as Map<dynamic, dynamic>)
          .toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: widget.data['date'], context: context),
      body: file != null
          ? PdfPreview(
              build: (format) => file!.save(),
              allowPrinting: true,
              allowSharing: true,
              canChangeOrientation: false,
              shareActionExtraEmails: [widget.data['date']],
              canChangePageFormat: false,
              shareActionExtraSubject: 'Hello ${widget.data['name']}.',
              shareActionExtraBody:
                  'Your Medical Record ${widget.data['date']}',
              pdfPreviewPageDecoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                        AppConstants.bkImage,
                      ),
                      fit: BoxFit.cover),
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(25.r)),
              actionBarTheme: PdfActionBarTheme(
                  backgroundColor: AppColors.scColor,
                  iconColor: AppColors.whiteColor,
                  textStyle: TextStyle(
                    color: AppColors.whiteColor,
                    fontFamily: AppConstants.fontFamily,
                  )),
            )
          : Background(
              padv: 2.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Screenshot(
                      controller: screenshotController,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            15.r,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 10.w),
                            color: AppColors.whiteColor,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            10.he(),
                                            appText(
                                              pw: 5.w,
                                              txt:
                                                  'Date: ${widget.data['date']}',
                                              size: AppConstants.mediumText,
                                              fw: FontWeight.w600,
                                              color: AppColors.fontColor,
                                            ),
                                            5.he(),
                                            appText(
                                              pw: 5.w,
                                              txt:
                                                  'Patient: ${widget.data['name']}',
                                              size: AppConstants.smallText,
                                              fw: FontWeight.w700,
                                              color: AppColors.hintColor,
                                            ),
                                            5.he(),
                                            appText(
                                              pw: 5.h,
                                              txt:
                                                  'Type: ${widget.data['type']}',
                                              size: AppConstants.smallText,
                                              fw: FontWeight.w900,
                                              color:
                                                  widget.data['type'] == 'Retry'
                                                      ? AppColors.redColor
                                                      : AppColors.primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        elevation: 0,
                                        color: AppColors.hintColor
                                            .withOpacity(0.05),
                                        child: QrImageView(
                                          data:
                                              '${widget.data['uid'] + widget.data['date']}',
                                          size: 100.w,
                                          dataModuleStyle:
                                              const QrDataModuleStyle(
                                                  color: AppColors.scColor),
                                          eyeStyle: const QrEyeStyle(
                                              color: AppColors.primaryColor),
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: AppColors.hintColor,
                                  ),
                                  10.he(),
                                  appText(
                                    txt: 'Main Report:',
                                    size: AppConstants.mediumText,
                                    fw: FontWeight.w600,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      appText(
                                        align: TextAlign.start,
                                        txt: '●',
                                        color: AppColors.scColor,
                                        size: AppConstants.smallText + 1,
                                        fw: FontWeight.w400,
                                      ),
                                      Expanded(
                                        child: appText(
                                          align: TextAlign.start,
                                          ph: 4.h,
                                          pw: 4.h,
                                          txt: '${widget.data['report']}',
                                          size: AppConstants.smallText + 1,
                                          fw: FontWeight.w400,
                                          ml: 5,
                                          color: AppColors.scColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.he(),
                                  appText(
                                    txt: 'Physical Examination:',
                                    size: AppConstants.mediumText,
                                    fw: FontWeight.w600,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      appText(
                                        align: TextAlign.start,
                                        txt: '●',
                                        color: AppColors.scColor,
                                        size: AppConstants.smallText + 1,
                                        fw: FontWeight.w400,
                                      ),
                                      Expanded(
                                        child: appText(
                                          align: TextAlign.start,
                                          ph: 4.h,
                                          pw: 4.h,
                                          txt:
                                              'Temperature: ${widget.data['temp'] + 'Celsius.'}',
                                          size: AppConstants.smallText + 1,
                                          fw: FontWeight.w400,
                                          ml: 5,
                                          color: AppColors.scColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      appText(
                                        align: TextAlign.start,
                                        txt: '●',
                                        color: AppColors.scColor,
                                        size: AppConstants.smallText + 1,
                                        fw: FontWeight.w400,
                                      ),
                                      Expanded(
                                        child: appText(
                                          align: TextAlign.start,
                                          ph: 4.h,
                                          pw: 4.h,
                                          txt:
                                              'Blood Pressure: ${widget.data['blood']} mmHg.',
                                          size: AppConstants.smallText + 1,
                                          fw: FontWeight.w400,
                                          ml: 5,
                                          color: AppColors.scColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      appText(
                                        align: TextAlign.start,
                                        txt: '●',
                                        color: AppColors.scColor,
                                        size: AppConstants.smallText + 1,
                                        fw: FontWeight.w400,
                                      ),
                                      Expanded(
                                        child: appText(
                                          align: TextAlign.start,
                                          ph: 4.h,
                                          pw: 4.h,
                                          txt: 'Symptoms: ',
                                          size: AppConstants.smallText + 1,
                                          fw: FontWeight.w700,
                                          ml: 5,
                                          color: AppColors.scColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ...List.generate(
                                      widget.data['symptoms'].length, (index) {
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        appText(
                                          align: TextAlign.start,
                                          txt: '    ${index + 1}- ',
                                          color: AppColors.scColor,
                                          size: AppConstants.smallText + 1,
                                          fw: FontWeight.w400,
                                        ),
                                        Expanded(
                                          child: appText(
                                            align: TextAlign.start,
                                            // ph: 4.h,
                                            // pw: 4.h,
                                            txt:
                                                '${widget.data['symptoms'][index]}.',
                                            size: AppConstants.smallText + 1,
                                            fw: FontWeight.w400,
                                            ml: 5,
                                            color: AppColors.scColor,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                  10.he(),
                                  appText(
                                    txt: 'Treatment Plan:',
                                    size: AppConstants.mediumText,
                                    fw: FontWeight.w600,
                                  ),
                                  Container(
                                    // height: 150.h,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(10.w),
                                    decoration: BoxDecoration(
                                      color: AppColors.scColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Wrap(
                                        alignment: WrapAlignment.start,
                                        spacing: 20.w,
                                        children: drugs.map((hour) {
                                          return FilterChip(
                                            backgroundColor: AppColors.scColor,
                                            shape: const StadiumBorder(),
                                            // checkmarkColor: AppColors.whiteColor,
                                            labelStyle: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontFamily:
                                                  AppConstants.fontFamily,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            label: appText(
                                                txt:
                                                    '${hour['drug']} - Take ${hour['times']} times/${hour['duration']}',
                                                size:
                                                    AppConstants.verySmallText,
                                                fw: FontWeight.w800,
                                                color: AppColors.whiteColor),
                                            onSelected: (selected) {},
                                          );
                                        }).toList()),
                                  ),
                                  10.he(),
                                  appText(
                                    txt: 'Required Medical Tests :',
                                    size: AppConstants.mediumText,
                                    fw: FontWeight.w600,
                                  ),
                                  widget.data['required_tests'] == []
                                      ? const SizedBox.shrink()
                                      : Wrap(
                                          // alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          spacing: 10.w,
                                          children: List.generate(
                                              widget.data['required_tests']
                                                  .length,
                                              (index) => SizedBox(
                                                    child: Chip(
                                                      labelPadding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      avatar: Icon(
                                                        Icons
                                                            .drive_folder_upload_rounded,
                                                        color: AppColors
                                                            .whiteColor,
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.w),
                                                      backgroundColor:
                                                          AppColors.redColor,
                                                      label: appText(
                                                        txt: widget.data[
                                                                'required_tests']
                                                            [index],
                                                        size: AppConstants
                                                            .smallText,
                                                        fw: FontWeight.w500,
                                                        color: AppColors
                                                            .whiteColor,
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                  10.he(),
                                  appText(
                                    txt: 'Uploaded Medical Tests :',
                                    size: AppConstants.mediumText,
                                    fw: FontWeight.w600,
                                  ),
                                  widget.data['tests'] == null
                                      ? const SizedBox.shrink()
                                      : Wrap(
                                          // alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          spacing: 10.w,
                                          children: List.generate(
                                              widget.data['tests'].length,
                                              (index) => SizedBox(
                                                    child: Chip(
                                                      labelPadding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      avatar: Icon(
                                                        index.isEven
                                                            ? Icons
                                                                .check_box_rounded
                                                            : Icons
                                                                .drive_folder_upload_rounded,
                                                        color: AppColors
                                                            .whiteColor,
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.w),
                                                      backgroundColor:
                                                          AppColors.scColor,
                                                      label: appText(
                                                        txt:
                                                            widget.data['tests']
                                                                [index],
                                                        size: AppConstants
                                                            .smallText,
                                                        fw: FontWeight.w500,
                                                        color: AppColors
                                                            .whiteColor,
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    5.he(),
                    Center(
                      child: AppButton(
                          txt: 'Print Or Share',
                          w: 200.w,
                          h: 35.h,
                          color: AppColors.primaryColor,
                          onTap: () async {
                            await convertToPdf();
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
