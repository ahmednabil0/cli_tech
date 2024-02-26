import 'package:flutter/material.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/text.dart';

showAlertDialog({
  required BuildContext context,
  required Widget widget,
  required String txt,
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
      fw: FontWeight.w600,
      color: AppColors.scColor,
    ),
    content: widget,
    actions: actions,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
