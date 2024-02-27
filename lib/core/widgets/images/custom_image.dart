import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imgPath,
    this.h,
    this.w,
    this.avater,
    this.fit = BoxFit.fill,
  });
  final String imgPath;
  final double? h;
  final double? w;
  final BoxFit? fit;
  final bool? avater;
  @override
  Widget build(BuildContext context) {
    return avater != null
        ? CircleAvatar(
            radius: 10.r,
            backgroundImage: AssetImage(imgPath),
            // foregroundImage: const AssetImage('assets/images/image_picker.png'),
            onBackgroundImageError: (exception, stackTrace) {
              print('000000000000000');
              print(exception);
            },
            backgroundColor: AppColors.hintColor,
          )
        : Image.asset(
            imgPath,
            width: w,
            height: h,
            fit: fit,
          );
  }
}
