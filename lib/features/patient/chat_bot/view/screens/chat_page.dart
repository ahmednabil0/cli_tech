import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:gradution_project/core/widgets/tff.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'Chat Bot', wi: true),
      body: Background(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  child: BubbleSpecialTwo(
                    text: index.isEven || index < 2
                        ? 'i want to ask you somethimg'
                        : index > 2 || index < 6
                            ? 'My Eye Hurt Me'
                            : 'Hello how are you',
                    color:
                        index.isEven ? AppColors.whiteColor : AppColors.scColor,
                    tail: true,
                    isSender: index.isEven ? true : false,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: index.isEven ? AppColors.scColor : Colors.white,
                      fontFamily: AppConstants.fontFamily,
                      fontSize: AppConstants.smallText,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomTextField(
                    width: 250.w,
                    height: 42.h,
                    controller: TextEditingController(),
                    hint: 'Message Here....',
                  ),
                  Card(
                    color: AppColors.scColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                        color: AppColors.whiteColor,
                        size: AppConstants.ultraText,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
