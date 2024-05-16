import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/text.dart';

showToastError(
    {required String msg,
    String? des,
    required BuildContext context,
    Color? bColor,
    Color? tColor}) {
  CherryToast.error(
    title: appTextWP(
      txt: msg,
      fw: FontWeight.w800,
      align: TextAlign.start,
      ml: 10,
      size: AppConstants.mediumText,
      color: tColor ?? AppColors.redColor,
    ),
    description: appTextWP(
      txt: des ?? '',
      ml: 10,
      align: TextAlign.start,
      size: AppConstants.smallText,
      color: tColor ?? AppColors.fontColor.withOpacity(0.7),
    ),
    // backgroundColor: bColor ?? AppColors.redColor,
    animationType: AnimationType.fromTop,
    animationDuration: const Duration(milliseconds: 600),
    autoDismiss: true,
  ).show(context);
}

showToastWarring(
    {required String msg,
    String? des,
    required BuildContext context,
    Color? bColor,
    Color? tColor}) {
  CherryToast.warning(
    title: appTextWP(
      txt: msg,
      fw: FontWeight.w800,
      align: TextAlign.start,
      ml: 10,
      size: AppConstants.mediumText,
      color: tColor ?? Colors.orangeAccent,
    ),
    width: double.infinity,

    description: appTextWP(
      txt: des ?? '',
      ml: 10,
      align: TextAlign.start,
      size: AppConstants.smallText,
      color: tColor ?? AppColors.fontColor.withOpacity(0.7),
    ),
    // backgroundColor: bColor ?? AppColors.redColor,
    animationType: AnimationType.fromTop,

    animationDuration: const Duration(milliseconds: 600),
    autoDismiss: true,
  ).show(context);
}

showToastSucess(
    {required String msg,
    String? des,
    bool? dismissibles,
    required BuildContext context,
    Color? bColor,
    Color? tColor}) {
  CherryToast.success(
    title: appTextWP(
      txt: msg,
      fw: FontWeight.w800,
      align: TextAlign.start,
      ml: 10,
      size: AppConstants.mediumText,
      color: tColor ?? AppColors.scColor,
    ),
    description: appTextWP(
      txt: des ?? '',
      fw: FontWeight.w600,
      align: TextAlign.start,
      ml: 10,
      size: AppConstants.smallText,
      color: tColor ?? AppColors.fontColor.withOpacity(0.7),
    ),
    // backgroundColor: bColor ?? AppColors.scColor,
    animationType: AnimationType.fromTop,
    animationDuration: const Duration(milliseconds: 600),

    autoDismiss: dismissibles ?? true,
  ).show(context);
}
