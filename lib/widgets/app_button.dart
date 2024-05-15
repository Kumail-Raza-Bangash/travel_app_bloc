// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_app_bloc/app_constants/dimensions.dart';
import 'package:travel_app_bloc/widgets/big_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon = false;

  AppButton({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
    required this.isIcon,
    this.text = "3",
    this.icon = Icons.heart_broken,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: EdgeInsets.only(
        right: Dimensions.width10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Center(
        child: isIcon == false
            ? BigText(
                text: text!,
                color: color,
                size: Dimensions.font30,
              )
            : Icon(
                icon!,
                color: color,
              ),
      ),
    );
  }
}
