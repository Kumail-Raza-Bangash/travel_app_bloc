import 'package:flutter/material.dart';
import 'package:travel_app_bloc/app_constants/colors.dart';
import 'package:travel_app_bloc/app_constants/dimensions.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({super.key, this.isResponsive, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: Dimensions.height30 * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
        color: AppColor.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/button-one.png",
            height: Dimensions.height30,
          ),
        ],
      ),
    );
  }
}
