import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/images/custom_image.dart';

class CustomAvatarImage extends StatelessWidget {
  const CustomAvatarImage({
    super.key,
    this.image,
  });
  final String? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
            radius: 75.w,
            backgroundImage: CachedNetworkImageProvider(
              image!,
            ),
          )
        : const CustomImage(
            imgPath: AppConstants.imagePicker,
            avater: true,
          );
  }
}
