import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_const.dart';

class MyCustomTextField extends StatelessWidget {
  // Declare your custom vars, including your validator function
  final String? changedValue;
  final String? hint;
  final double? width;
  final int? max;
  final Color? color;
  final Widget? icon;
  final Color? bcolor;
  final TextEditingController controller;
  final bool? isTextObscured;
  final String? Function(String?)? validator;
  void Function(String value)? onChanged;

  MyCustomTextField({
    Key? key,
    this.changedValue,
    required this.controller,
    this.hint,
    this.max,
    this.isTextObscured,
    this.color,
    this.onChanged,
    this.icon,
    this.bcolor,
    this.validator,
    this.width,
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
      height: 45.h,
      child: TextFormField(
        controller: controller,
        maxLines: max ?? 1,
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: AppConstants.smallText,
          fontWeight: FontWeight.w500,
        ),
        obscureText: isTextObscured ?? false,
        cursorColor: color ?? Colors.black,
        obscuringCharacter: '●',
        decoration: InputDecoration(
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
