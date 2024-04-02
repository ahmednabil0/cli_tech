import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/static_data/all_doctor_spcialist/all_doctor_specialiest.dart';
import 'package:gradution_project/core/static_data/all_doctor_spcialist/specicty_model.dart';
import 'package:gradution_project/core/widgets/build_qr_scanner.dart';
import 'package:gradution_project/features/auth/view_model/signup/signup_bloc.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/sized_box.dart';
import '../../../core/widgets/space.dart';
import '../../../core/widgets/text.dart';
import '../../../core/widgets/tff.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
    required this.role,
  });
  final String? role;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool scanning = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        pad: 0,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      constraints:
                          BoxConstraints(maxHeight: 280.w, minHeight: 200.w),
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.55),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45.r),
                          bottomRight: Radius.circular(45.r),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppConstants.signUp,
                            height: 120.h,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 1.h,
                            child: appText(
                              ph: 10.h,
                              txt: 'Sign Up',
                              size: AppConstants.ultraText,
                              fw: FontWeight.w700,
                              color: AppColors.scColor,
                            ),
                          ),
                        ],
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
                        txt: 'Join Us.',
                        size: AppConstants.ultraText,
                        fw: FontWeight.w900,
                      ),
                    ),
                    HSizedBox(
                      he: 10.h,
                    ),
                    BlocConsumer<SignupBloc, SignupState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Form(
                          key: BlocProvider.of<SignupBloc>(context).key,
                          child: Column(
                            children: [
                              MyCustomTextField(
                                controller:
                                    BlocProvider.of<SignupBloc>(context).name,
                                color: Colors.black,
                                hint: 'Your Name',
                                icon: Icon(
                                  Icons.person_pin,
                                  color: AppColors.scColor,
                                  size: 25.h,
                                ),
                                width: 290.w,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.max(30),
                                  FormBuilderValidators.min(3),
                                ]),
                              ),
                              HSizedBox(
                                he: 10.h,
                              ),
                              MyCustomTextField(
                                controller:
                                    BlocProvider.of<SignupBloc>(context).phone,
                                color: Colors.black,
                                icon: Icon(
                                  Icons.contact_phone_rounded,
                                  color: AppColors.scColor,
                                  size: 25.h,
                                ),
                                hint: 'Phone Number',
                                width: 290.w,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                ]),
                              ),
                              HSizedBox(
                                he: 10.h,
                              ),
                              widget.role == 'doctor'
                                  ? SizedBox(
                                      width: 290.w,
                                      child:
                                          CustomDropdown<SpecialtyModel>.search(
                                        validator:
                                            FormBuilderValidators.required(),
                                        hintText: 'Select Specialization',
                                        canCloseOutsideBounds: true,
                                        noResultFoundBuilder: (context, text) =>
                                            Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(14.0.h),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.error_outline_rounded,
                                                  color: Colors.red,
                                                  size: 15.h,
                                                ),
                                                appText(
                                                  align: TextAlign.start,
                                                  ph: 0,
                                                  txt: '*$text*',
                                                  color: Colors.red,
                                                  size: AppConstants.smallText,
                                                  fw: FontWeight.w500,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        hintBuilder: (context, hint) {
                                          return appText(
                                              align: TextAlign.start,
                                              txt: hint,
                                              color: AppColors.hintColor,
                                              size: AppConstants.smallText,
                                              fw: FontWeight.w500);
                                        },
                                        items: doctorSpecialties,
                                        excludeSelected: false,
                                        onChanged: (value) {},
                                      ),
                                    )
                                  : MyCustomTextField(
                                      controller:
                                          BlocProvider.of<SignupBloc>(context)
                                              .doctorUid,
                                      hint: 'Doctor Uid',
                                      width: 290.w,
                                      validator:
                                          FormBuilderValidators.required(),
                                      icon: IconButton(
                                        onPressed: () async {
                                          String? scannedCode =
                                              await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return buildQrScannerDialog(
                                                context: context,
                                                txt: 'Scan Doctor Uid',
                                                scanning: scanning,
                                                qrKey: qrKey,
                                                onQRViewCreated: (controller) =>
                                                    _onQRViewCreated(
                                                        controller),
                                              );
                                            },
                                          );
                                          if (scannedCode != null) {
                                            // Do something with the scanned code
                                            // ignore: use_build_context_synchronously
                                            BlocProvider.of<SignupBloc>(context)
                                                .doctorUid
                                                .text = scannedCode;
                                            setState(() {});
                                          } else {
                                            // ignore: avoid_print
                                            print('X' * 100);
                                          }
                                        },
                                        padding: const EdgeInsets.all(0),
                                        icon: Icon(
                                          Icons.qr_code_scanner_rounded,
                                          color: AppColors.scColor,
                                          size: 25.h,
                                        ),
                                      )),
                              HSizedBox(
                                he: 10.h,
                              ),
                              MyCustomTextField(
                                controller:
                                    BlocProvider.of<SignupBloc>(context).email,
                                hint: 'doctor.ali@gmail.com',
                                width: 290.w,
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.email(),
                                    FormBuilderValidators.required(),
                                  ],
                                ),
                                icon: Image.asset('assets/images/email.png'),
                              ),
                              HSizedBox(
                                he: 10.h,
                              ),
                              MyCustomTextField(
                                controller:
                                    BlocProvider.of<SignupBloc>(context).pass,
                                validator: FormBuilderValidators.required(),
                                hint: '●●●●●●●●',
                                width: 290.w,
                                isTextObscured:
                                    BlocProvider.of<SignupBloc>(context)
                                        .isLoginPasswordShowing,
                                icon: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<SignupBloc>(context)
                                          .changeLoginPasswordSuffixIcon();
                                    },
                                    icon: Icon(
                                      BlocProvider.of<SignupBloc>(context)
                                          .suffixIcon,
                                      color: AppColors.scColor,
                                    )),
                              ),
                              HSizedBox(
                                he: 35.h,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            AppButton(
              w: 220.w,
              txt: 'Sign Up',
              onTap: () {
                if (BlocProvider.of<SignupBloc>(context)
                    .key
                    .currentState!
                    .validate()) {
                  if (widget.role == 'patient' ||
                      widget.role == 'receptionist') {
                    navigateReplace(
                      context: context,
                      route: Routes.pendingPage,
                      args: widget.role,
                    );
                  } else {
                    navigateReplace(
                      context: context,
                      route: Routes.doctorHomePage,
                    );
                  }
                }
              },
            ),
            textButton(
              ph: 5.h,
              txt: 'have an account? Login',
              size: AppConstants.smallText,
              fw: FontWeight.w500,
              onTap: () {
                navigateReplace(
                  context: context,
                  route: Routes.loginPage,
                );
              },
              color: AppColors.scColor,
            ),
            HSizedBox(
              he: 10.h,
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      scanning = true;
    });

    controller.scannedDataStream.listen((scanData) {
      // Handle the scanned QR code data here

      // Stop scanning and close the dialog
      controller.stopCamera();
      setState(() {
        scanning = false;
      });
      Navigator.of(context).pop(scanData.code);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
