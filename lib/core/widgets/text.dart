import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_const.dart';

Padding appText(
    {required String txt,
    String? ff,
    Color? color,
    required double size,
    double? pw,
    double? ph,
    int? ml,
    FontWeight? fw,
    TextOverflow? of,
    bool? under,
    TextAlign? align}) {
  return Padding(
    padding: EdgeInsetsDirectional.symmetric(
      horizontal: pw ?? 0,
      vertical: ph ?? 0,
    ),
    child: Text(
      txt,
      overflow: of ?? TextOverflow.visible,
      maxLines: ml ?? 1,
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
  );
}
