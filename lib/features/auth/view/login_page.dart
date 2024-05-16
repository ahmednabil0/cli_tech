import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';

import 'package:gradution_project/features/auth/view_model/login_cubit/logincubit_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/sized_box.dart';
import '../../../core/widgets/space.dart';
import '../../../core/widgets/text.dart';
import '../../../core/widgets/tff.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        pad: 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.55),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35.r),
                    bottomRight: Radius.circular(35.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppConstants.login,
                        fit: BoxFit.cover,
                        width: 250,
                      ),
                      appText(
                        ph: 10.h,
                        txt: 'Login',
                        size: AppConstants.ultraText,
                        fw: FontWeight.w700,
                        color: AppColors.scColor,
                      ),
                    ],
                  ),
                ),
              ),
              HSizedBox(
                he: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: appText(
                  ph: 10.h,
                  pw: 20.w,
                  txt: 'Welcome Back Again.',
                  size: AppConstants.largeText,
                  fw: FontWeight.w700,
                ),
              ),
              HSizedBox(
                he: 30.h,
              ),
              BlocConsumer<LoginCubit, LoginCubitState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Form(
                    key: BlocProvider.of<LoginCubit>(context).key,
                    child: Column(
                      children: [
                        MyCustomTextField(
                          controller:
                              BlocProvider.of<LoginCubit>(context).email,
                          hint: 'doctor.ali@gmail.com',
                          width: 290.w,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.email(),
                            FormBuilderValidators.required(),
                          ]),
                          icon: Image.asset('assets/images/email.png'),
                        ),
                        HSizedBox(
                          he: 10.h,
                        ),
                        MyCustomTextField(
                          controller: BlocProvider.of<LoginCubit>(context).pass,
                          validator: FormBuilderValidators.required(),
                          hint: '●●●●●●●●',
                          width: 290.w,
                          isTextObscured: BlocProvider.of<LoginCubit>(context)
                              .isLoginPasswordShowing,
                          icon: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                BlocProvider.of<LoginCubit>(context)
                                    .changeLoginPasswordSuffixIcon();
                              },
                              icon: Icon(
                                BlocProvider.of<LoginCubit>(context).suffixIcon,
                                color: AppColors.scColor,
                              )),
                        ),
                        HSizedBox(
                          he: 20.h,
                        ),
                        AppButton(
                          w: 220.w,
                          txt: 'Login',
                          loading: state ==
                              const LoginCubitState.loginLoadingState(),
                          onTap: () async {
                            await BlocProvider.of<LoginCubit>(context)
                                .login(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              textButton(
                ph: 5.h,
                txt: 'Forget password',
                size: AppConstants.smallText,
                fw: FontWeight.w500,
                onTap: () {},
                color: AppColors.primaryColor,
              ),
              HSizedBox(
                he: 20.h,
              ),
              textButton(
                ph: 5.h,
                txt: 'Don’t have an account? Join us',
                size: AppConstants.smallText,
                fw: FontWeight.w500,
                onTap: () {
                  navigateReplace(
                    context: context,
                    route: Routes.selectRolePage,
                  );
                },
                color: AppColors.scColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
