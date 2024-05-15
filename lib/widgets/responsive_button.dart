import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app_bloc/app_constants/colors.dart';
import 'package:travel_app_bloc/app_constants/dimensions.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  String text;
  Color borderColor;
  Color? color;
  Color? textColor;
  double iconHeight;
  double? width;
  double? height;
  double? fontSize;

  ResponsiveButton({
    super.key,
    this.isResponsive,
    this.text = '',
    this.iconHeight = 20,
    this.width = 120,
    this.height = 60,
    this.fontSize = 20,
    this.color = AppColor.transparentColor,
    this.borderColor = AppColor.transparentColor,
    this.textColor = AppColor.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? Dimensions.screenWidth : width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          color: color,
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(),
            Image.asset(
              "images/arrow.png",
              height: iconHeight,
            ),
          ],
        ),
      ),
    );
  }
}
