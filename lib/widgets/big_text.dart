import 'package:flutter/material.dart';
import 'package:travel_app_bloc/app_constants/colors.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  BigText({
    super.key,
    this.size = 30.0,
    required this.text,
    this.color = AppColor.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
