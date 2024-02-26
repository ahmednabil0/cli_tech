import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSizedBox extends StatelessWidget {
  const HSizedBox({
    this.he,
    super.key,
  });
  final double? he;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: he != null ? he! : 10.h,
    );
  }
}

class WSizedBox extends StatelessWidget {
  const WSizedBox({
    this.w,
    super.key,
  });
  final double? w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w != null ? w! : 10.w,
    );
  }
}
