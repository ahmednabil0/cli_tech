// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/widgets.dart' as pw;

class ViewPatientMedicalRrcordPage extends StatefulWidget {
  const ViewPatientMedicalRrcordPage({super.key});

  @override
  State<ViewPatientMedicalRrcordPage> createState() =>
      _ViewPatientMedicalRrcordPageState();
}

class _ViewPatientMedicalRrcordPageState
    extends State<ViewPatientMedicalRrcordPage> {
  final ScreenshotController screenshotController = ScreenshotController();

  pw.Document? file;

  String _getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: '2024/03/3', context: context),
      body: file != null
          ? PdfPreview(
              build: (format) => file!.save(),
              allowPrinting: true,
              allowSharing: true,
              canChangeOrientation: false,
              canChangePageFormat: false,
              previewPageMargin:
                  EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
              pdfPreviewPageDecoration: BoxDecoration(
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
              padv: 10.h,
              child: Screenshot(
                controller: screenshotController,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      15.r,
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
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
                                        pw: 5.h,
                                        txt: 'Date: March 5, 2024',
                                        size: AppConstants.mediumText,
                                        fw: FontWeight.w600,
                                        color: AppColors.fontColor,
                                      ),
                                      5.he(),
                                      appText(
                                        pw: 5.h,
                                        txt: 'Patient Name: John Smith',
                                        size: AppConstants.smallText,
                                        fw: FontWeight.w500,
                                        color: AppColors.hintColor,
                                      ),
                                      5.he(),
                                      appText(
                                        pw: 5.h,
                                        txt: 'Date: March 5, 2024',
                                        size: AppConstants.smallText,
                                        fw: FontWeight.w500,
                                        color: AppColors.hintColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                  elevation: 0,
                                  color: AppColors.hintColor.withOpacity(0.05),
                                  child: QrImageView(
                                    data: '10000000211',
                                    size: 100.w,
                                    dataModuleStyle: const QrDataModuleStyle(
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
                              txt: 'Main Symptoms:',
                              size: AppConstants.mediumText,
                              fw: FontWeight.w600,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        'The patient complains of severe pain in the lower right abdomen, accompanied by high fever and nausea.',
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    txt: 'Temperature: 39.2 degrees Celsius.',
                                    size: AppConstants.smallText + 1,
                                    fw: FontWeight.w400,
                                    ml: 5,
                                    color: AppColors.scColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    txt: 'Pulse: 100 beats per minute.',
                                    size: AppConstants.smallText + 1,
                                    fw: FontWeight.w400,
                                    ml: 5,
                                    color: AppColors.scColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    txt: 'Blood Pressure: 120/80 mmHg.',
                                    size: AppConstants.smallText + 1,
                                    fw: FontWeight.w400,
                                    ml: 5,
                                    color: AppColors.scColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        'Abdomen: The patient feels pain when pressure is applied to the lower right side of the abdomen.',
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
                              txt: 'Treatment Plan:',
                              size: AppConstants.mediumText,
                              fw: FontWeight.w600,
                            ),
                            Table(
                              border: TableBorder.all(
                                color: AppColors.scColor,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              children: [
                                TableRow(children: [
                                  appText(
                                    align: TextAlign.center,
                                    txt: 'Name',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w600,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: 'Frequency',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w600,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: 'Type',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w600,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: 'Quantity',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w600,
                                  ),
                                ]),
                                TableRow(children: [
                                  appText(
                                    align: TextAlign.center,
                                    txt: 'a1 cream 100 gm',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: '2 / 1',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: 'cream',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: '2 Taplets',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                ]),
                                TableRow(children: [
                                  appText(
                                    align: TextAlign.center,
                                    txt: 'a1 cream 100 gm',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: '2 / 1',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: 'cream',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: '2 Taplets',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                ]),
                                TableRow(children: [
                                  appText(
                                    align: TextAlign.center,
                                    txt: 'a1 cream 100 gm',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: '2 / 1',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: 'cream',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                  appText(
                                    align: TextAlign.center,
                                    txt: '2 Taplets',
                                    size: AppConstants.verySmallText,
                                    fw: FontWeight.w500,
                                  ),
                                ]),
                              ],
                            ),
                            10.he(),
                            appText(
                              txt: 'Required Medical Tests :',
                              size: AppConstants.mediumText,
                              fw: FontWeight.w600,
                            ),
                            Wrap(
                              // alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: 10.w,
                              children: List.generate(
                                  4,
                                  (index) => SizedBox(
                                        child: InkWell(
                                          onTap: () async {
                                            await convertToPdf();
                                          },
                                          child: Chip(
                                            labelPadding:
                                                const EdgeInsets.all(0),
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
                                        ),
                                      )),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
    );
  }
}
