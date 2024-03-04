import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/text.dart';

AppBar buildAppBar({
  String? title,
  BuildContext? context,
  Color? color,
  Color? icolor,
  Color? tcolor,
}) {
  return AppBar(
    backgroundColor: color ?? Colors.transparent,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        navigatePop(
          context: context,
        );
      },
      icon: Icon(
        Icons.arrow_back_rounded,
        color: icolor ?? AppColors.scColor,
        size: 30.w,
      ),
    ),
    title: appText(
        txt: title ?? '',
        size: AppConstants.largeText,
        fw: FontWeight.w600,
        color: tcolor ?? AppColors.fontColor),
  );
}
