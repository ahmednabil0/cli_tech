import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

buildQrScannerDialog({
  required BuildContext context,
  required String txt,
  required bool scanning,
  required Key qrKey,
  required void Function(QRViewController) onQRViewCreated,
}) {
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    elevation: 0,
    title: appText(
      txt: txt,
      size: AppConstants.mediumText,
      fw: FontWeight.w600,
      color: AppColors.scColor,
    ),
    content: SizedBox(
      width: 250.w,
      height: 250.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildQRView(
            context: context,
            qrKey: qrKey,
            onQRViewCreated: onQRViewCreated,
          ),
          if (scanning)
            Center(
              child: SvgPicture.asset(
                AppConstants.qr,
                colorFilter: const ColorFilter.mode(
                  AppColors.scColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
        ],
      ),
    ),
    actions: [
      AppButton(
        w: 220.w,
        txt: 'Continuo',
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}

Widget buildQRView({
  required BuildContext context,
  required Key qrKey,
  required void Function(QRViewController) onQRViewCreated,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16.0.r),
    child: QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
    ),
  );
}
