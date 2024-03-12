import 'package:flutter/material.dart';
import 'package:gradution_project/features/patient/chat_bot/view/screens/chat_page.dart';
import 'package:gradution_project/features/patient/home/view/screens/home_screen.dart';
import 'package:gradution_project/features/patient/notification/view/screens/notification_page.dart';
import 'package:gradution_project/features/patient/profile/view/screens/patient_profile_page.dart';

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
    const ProfilePatientPage(
      wi: true,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return pages[index];
  }
}
