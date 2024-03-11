import 'package:flutter/material.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/features/patient/chat_bot/view/screens/chat_page.dart';
import 'package:gradution_project/features/patient/home/view/screens/home_screen.dart';
import 'package:gradution_project/features/patient/notification/view/screens/notification_page.dart';

class HomePatientBody extends StatelessWidget {
  HomePatientBody({
    super.key,
    required this.index,
  });
  final int index;
  final List<Widget> pages = [
    const HomePage(),
    const ChatBotPage(),
    const NotificationPatientPage(),
    Container(
      color: AppColors.redColor,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return pages[index];
  }
}
