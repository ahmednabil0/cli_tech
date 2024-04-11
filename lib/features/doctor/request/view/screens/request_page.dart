import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/features/doctor/request/view/widgets/carousel_slider_request.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_const.dart';
import '../../../../../core/routes/navigate.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int count = 7;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Requests',
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blueAccent,
          dividerHeight: 3,
          dividerColor: Colors.grey.withOpacity(0.4),
          tabs: [
            Tab(
                child: appText(
                    txt: "Received Requests ($count)",
                    size: AppConstants.largeText,
                    fw: FontWeight.bold,
                    color: _tabController.index == 0
                        ? AppColors.scColor
                        : Colors.grey)),
            Tab(
              child: appText(
                  txt: "My Requests",
                  size: AppConstants.largeText,
                  fw: FontWeight.bold,
                  color: _tabController.index == 1
                      ? AppColors.scColor
                      : Colors.grey),
            )
          ],
        ),
      ),
      body: Background(
          child: TabBarView(
        controller: _tabController,
        children: [
          CarouselSliderRequest(count: count),
          Container(
            height: MediaQuery.of(context).size.height.h,
            width: MediaQuery.of(context).size.width.w,
            color: Colors.orange,
          )
        ],
      )),
    );
  }

  AppBar buildAppBar({
    String? title,
    bool? wi,
    TabBar? bottom,
    required BuildContext? context,
    Color? color,
    Color? icolor,
    Color? tcolor,
  }) {
    return AppBar(
      backgroundColor: color ?? Colors.transparent,
      centerTitle: true,
      bottom: bottom,
      elevation: 0,
      leading: wi == false || wi == null
          ? IconButton(
              onPressed: () {
                navigatePop(
                  context: context,
                );
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: icolor ?? AppColors.scColor,
                size: 30.w,
              ),
            )
          : const SizedBox.shrink(),
      title: appText(
          txt: title ?? '',
          size: AppConstants.largeText,
          fw: FontWeight.w600,
          color: tcolor ?? AppColors.fontColor),
    );
  }
}
