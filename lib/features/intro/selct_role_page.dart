import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_const.dart';
import '../../core/db/cache/cache_helper.dart';
import '../../core/services/services_locator.dart';
import '../../core/widgets/button.dart';
import '../../core/widgets/sized_box.dart';
import '../../core/widgets/space.dart';
import '../../core/widgets/text.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
          pad: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                top: -100.h,
                left: -100.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.scColor.withOpacity(0.8),
                  radius: 180.r,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HSizedBox(
                    he: 30.h,
                  ),
                  Image.asset(
                    'assets/images/role.png',
                  ),
                  HSizedBox(
                    he: 25.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                          txt: ' Please Select Your Role Below:',
                          size: AppConstants.extraText,
                          fw: FontWeight.w500,
                          pw: 20.w),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: const MyRadioButtonWidget()),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class MyRadioButtonWidget extends StatefulWidget {
  const MyRadioButtonWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyRadioButtonWidgetState createState() => _MyRadioButtonWidgetState();
}

class _MyRadioButtonWidgetState extends State<MyRadioButtonWidget> {
  String _selectedRole = 'doctor';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile(
          title: appText(
            txt: 'I am a Doctor',
            align: TextAlign.start,
            size: AppConstants.largeText,
          ),
          activeColor: AppColors.scColor,
          value: 'doctor',
          groupValue: _selectedRole,
          onChanged: (value) {
            setState(() {
              _selectedRole = value!;
            });
          },
        ),
        RadioListTile(
          title: appText(
            align: TextAlign.start,
            txt: 'I am a Patient',
            size: AppConstants.largeText,
          ),
          activeColor: AppColors.scColor,
          value: 'patient',
          groupValue: _selectedRole,
          onChanged: (value) {
            setState(() {
              _selectedRole = value!;
            });
          },
        ),
        RadioListTile(
          title: appText(
            txt: 'I am a Receptionist',
            align: TextAlign.start,
            size: AppConstants.largeText,
          ),
          activeColor: AppColors.scColor,
          value: 'receptionist',
          groupValue: _selectedRole,
          onChanged: (value) {
            setState(() {
              _selectedRole = value!;
            });
          },
        ),
        HSizedBox(
          he: 40.h,
        ),
        Center(
          child: AppButton(
            w: 200,
            loading: loading,
            color: AppColors.scColor,
            txt: 'Get Strated',
            onTap: () async {
              loading = true;
              setState(() {});
              await sl<CacheHelper>()
                  .setData(key: 'role', value: _selectedRole);
              // print(sl<CacheHelper>().getData(key: 'role'));
              loading = false;

              // ignore: use_build_context_synchronously
              navigateReplace(
                context: context,
                route: Routes.signUpPage,
                args: _selectedRole,
              );
            },
          ),
        ),
      ],
    );
  }
}
