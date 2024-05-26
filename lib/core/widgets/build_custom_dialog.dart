import 'package:flutter/material.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/text.dart';

showAlertDialog({
  required BuildContext context,
  required Widget widget,
  required String txt,
  Color? color,
  required List<Widget> actions,
}) {
  // set up the button

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    elevation: 0,
    title: appText(
      txt: txt,
      size: AppConstants.mediumText,
      fw: FontWeight.w800,
      color: color ?? AppColors.primaryColor,
    ),
    content: widget,
    actions: actions,
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
