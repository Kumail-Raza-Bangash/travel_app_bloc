import 'package:flutter/material.dart';
import 'package:travel_app_bloc/app_constants/colors.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  SmallText({
    super.key,
    required this.size,
    required this.text,
    this.color = AppColor.greyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
