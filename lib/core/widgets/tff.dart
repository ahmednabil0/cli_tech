import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';

class MyCustomTextField extends StatelessWidget {
  // Declare your custom vars, including your validator function
  final String? changedValue;
  final String? hint;
  final String? lapel;
  final double? width;
  final double? height;
  final int? max;
  final Color? color;
  final Widget? icon;
  final Color? bcolor;
  final TextEditingController controller;
  final bool? isTextObscured;
  final bool? ro;
  final String? Function(String?)? validator;
  final void Function(String value)? onChanged;

  const MyCustomTextField({
    Key? key,
    this.changedValue,
    required this.controller,
    this.hint,
    this.ro,
    this.lapel,
    this.max,
    this.isTextObscured,
    this.color,
    this.onChanged,
    this.icon,
    this.bcolor,
    this.validator,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          border: Border.all(color: bcolor ?? Colors.transparent)),
      width: width ?? 280.w,
      height: height ?? 45.h,
      child: TextFormField(
        controller: controller,
        maxLines: max ?? 1,
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: AppConstants.smallText + 1,
          fontWeight: FontWeight.w500,
        ),
        obscureText: isTextObscured ?? false,
        cursorColor: color ?? Colors.black,
        obscuringCharacter: '●',
        readOnly: ro ?? false,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          labelText: lapel,
          labelStyle: TextStyle(
            fontFamily: AppConstants.fontFamily,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: AppConstants.smallText,
          ),
          suffixIconConstraints:
              BoxConstraints.tightForFinite(height: 25.h, width: 40.w),
          hintText: hint,
          suffixIcon: icon ?? const Icon(null),
        ),
        validator: validator,
        onChanged: onChanged ?? (value) {},
      ),
    );
  }
}
