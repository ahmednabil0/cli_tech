import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    this.color,
    this.pad,
  });
  final Color? color;
  final double? pad;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(pad ?? 0),
      child: SpinKitCircle(
        color: color ?? Colors.white,
        size: 50.0,
      ),
    );
  }
}
