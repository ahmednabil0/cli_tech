import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class Background extends StatelessWidget {
  const Background({
    required this.child,
    this.pad,
    super.key,
  });
  final Widget? child;
  final double? pad;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: pad ?? 25.r),
      color: AppColors.background,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: child!,
      ),
    );
  }
}
