import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/widgets/circle_pro_ind.dart';

import '../constants/app_colors.dart';
import '../constants/app_const.dart';
import 'text.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
      required this.txt,
      this.color,
      this.w,
      this.h,
      this.r,
      this.ts,
      this.tfw,
      this.border,
      this.loading,
      required this.onTap})
      : super(key: key);
  final String? txt;
  final Color? color;
  final double? w;
  final double? h;
  final double? r;
  final double? ts;
  final bool? border;
  final bool? loading;
  final FontWeight? tfw;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: w ?? 120,
        height: h ?? 50,
        decoration: BoxDecoration(
          color: border == true ? Colors.white : color ?? AppColors.scColor,
          borderRadius: BorderRadiusDirectional.circular(
            r ?? 10,
          ),
          border: border == true
              ? Border.all(
                  color: color ?? AppColors.primaryColor,
                )
              : Border.all(
                  color: Colors.transparent,
                ),
        ),
        child: loading == true
            ? CustomProgressIndicator(
                pad: 1.w,
              )
            : appText(
                pw: 16.sp,
                color: border == true ? AppColors.fontColor : Colors.white,
                txt: txt!,
                size: ts ?? AppConstants.mediumText,
                fw: tfw ?? FontWeight.w600,
              ),
      ),
    );
  }
}

InkWell textButton(
    {required String txt,
    String? ff,
    Color? color,
    required double size,
    double? pw,
    double? ph,
    FontWeight? fw,
    bool? under,
    required Function() onTap,
    TextAlign? align}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: pw ?? 0,
        vertical: ph ?? 0,
      ),
      child: Text(
        txt,
        textAlign: align ?? TextAlign.center,
        style: TextStyle(
          color: color ?? AppColors.fontColor,
          fontSize: size,
          fontFamily: ff ?? AppConstants.fontFamily,
          fontWeight: fw ?? FontWeight.normal,
          decoration:
              under == true ? TextDecoration.underline : TextDecoration.none,
          decorationColor: color,
          decorationThickness: size,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
    ),
  );
}
