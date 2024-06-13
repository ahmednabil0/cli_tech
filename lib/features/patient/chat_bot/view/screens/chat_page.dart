import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:gradution_project/features/patient/chat_bot/view_model/patients_messages/patients_messages_bloc.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'Messages', wi: true),
      body: Background(
          child: BlocBuilder<PatientsMessagesBloc, PatientsMessagesState>(
        builder: (context, state) {
          var bloc = BlocProvider.of<PatientsMessagesBloc>(context);
          return Column(
            children: [
              // appText(
              //   txt: 'Daily Limit Message Is 2, You Have 1 Remain Today',
              //   size: AppConstants.verySmallText,
              //   color: AppColors.redColor,
              // ),
              Expanded(
                child: state == const PatientsMessagesState.loading()
                    ? const SpinKitCircle(
                        color: AppColors.scColor,
                      )
                    : bloc.messages.isEmpty
                        ? const SizedBox.shrink()
                        : ListView.builder(
                            reverse: true,
                            itemCount: bloc.messages.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 7.h),
                                child: Column(
                                  children: [
                                    BubbleSpecialOne(
                                      text: bloc.messages[index]['msg'],
                                      color: AppColors.scColor,
                                      tail: true,
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontFamily: AppConstants.fontFamily,
                                        fontSize: AppConstants.smallText,
                                      ),
                                    ),
                                    bloc.messages[index]['reply'].isNotEmpty
                                        ? Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                        bloc.messages[index]
                                                            ['photo']),
                                              ),
                                              BubbleSpecialOne(
                                                text: bloc.messages[index]
                                                    ['reply'],
                                                color: AppColors.whiteColor,
                                                tail: true,
                                                isSender: false,
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.scColor,
                                                  fontFamily:
                                                      AppConstants.fontFamily,
                                                  fontSize:
                                                      AppConstants.smallText,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              );
                            },
                          ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  bottom: 10.h,
                ),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCustomTextField(
                        width: 250.w,
                        height: 42.h,
                        controller: bloc.msgController,
                        hint: 'Message Here....',
                      ),
                      Card(
                        color: AppColors.scColor,
                        child: state == const PatientsMessagesState.loading()
                            ? SpinKitCircle(
                                color: AppColors.whiteColor,
                              )
                            : IconButton(
                                onPressed: () async {
                                  await bloc.sendMessage();
                                },
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
          );
        },
      )),
    );
  }
}
