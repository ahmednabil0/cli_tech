import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/widgets/images/profile_image.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Background(
        child: Column(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Icon(
        Icons.menu_rounded,
        color: AppColors.scColor,
        size: 30.w,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: const SizedBox(
            width: 50,
            height: 50,
            child: CustomAvatarImage(),
          ),
        ),
      ],
    );
  }
}
