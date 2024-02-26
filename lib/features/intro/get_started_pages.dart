import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/routes/app_routes.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_const.dart';
import '../../core/widgets/button.dart';
import '../../core/widgets/scroll_behavior.dart';
import '../../core/widgets/sized_box.dart';
import '../../core/widgets/space.dart';
import '../../core/widgets/text.dart';

// ignore: must_be_immutable
class GetStarted extends StatefulWidget {
  GetStarted({super.key});
  final List<Map> images = [
    {
      'title': 'Empowering Healthcare Together Your Health, Our Priority',
      'image': 'assets/images/intr1.png',
    },
    {
      'title': 'Access Your Health Records Anytime, Anywhere',
      'image': 'assets/images/intr2.png',
    },
    {
      'title': 'Your First Step to Personalized Healthcare ,Start Now',
      'image': 'assets/images/intro3.png',
    },
  ];
  int index = 0;
  final PageController _pageController = PageController();
  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
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
                left: widget.index.isEven ? 150.w : -100.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.scColor.withOpacity(0.8),
                  radius: 180.r,
                ),
              ),
              PageView.builder(
                scrollBehavior: MyBehavior(),
                physics: const NeverScrollableScrollPhysics(),
                controller: widget._pageController,
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(widget.images[index]['image']),
                      HSizedBox(
                        he: 30.h,
                      ),
                      appText(
                        pw: 16.w,
                        txt: widget.images[index]['title'],
                        size: AppConstants.mediumText,
                        fw: FontWeight.w500,
                      ),
                      HSizedBox(
                        he: 50.h,
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                  bottom: 30.h,
                  child: Column(
                    children: [
                      AppButton(
                        w: 200,
                        color: AppColors.scColor,
                        txt: 'Get Strated',
                        onTap: () {
                          setState(() {
                            if (widget.index < 2) {
                              widget._pageController.animateToPage(
                                widget.index + 1,
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.easeIn,
                              );
                              widget.index++;
                            } else {
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.selectRolePage,
                              );
                            }
                          });
                        },
                      ),
                      widget.index < 2
                          ? textButton(
                              ph: 10.w,
                              txt: 'Skip',
                              color: AppColors.hintColor,
                              size: AppConstants.smallText,
                              fw: FontWeight.w600,
                              onTap: () {
                                setState(() {
                                  widget.index = 2;
                                  widget._pageController.animateToPage(
                                    2,
                                    duration: const Duration(
                                      milliseconds: 500,
                                    ),
                                    curve: Curves.easeIn,
                                  );
                                });
                              },
                            )
                          : SizedBox(
                              height: 30.h,
                            )
                    ],
                  ))
            ],
          )),
    );
  }
}
