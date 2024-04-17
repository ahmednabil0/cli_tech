import 'package:flutter/material.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/features/doctor/request/view/widgets/carousel_slider_request.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'Pending Requests'),
      body: const Background(
        child: CarouselSliderRequest(count: 7),
      ),
    );
  }
}
