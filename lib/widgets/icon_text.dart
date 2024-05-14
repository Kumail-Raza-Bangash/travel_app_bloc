import 'package:flutter/material.dart';
import 'package:travel_app_bloc/app_constants/colors.dart';
import 'package:travel_app_bloc/app_constants/dimensions.dart';
import 'package:travel_app_bloc/widgets/small_text.dart';

class IconAndText extends StatefulWidget {
  IconAndText({super.key});

  @override
  State<IconAndText> createState() => _IconAndTextState();
}

class _IconAndTextState extends State<IconAndText> {

  var images = {
    "": ""
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.radius15 / 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: Dimensions.height10 * 7,
            width: Dimensions.width10 * 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              image: const DecorationImage(
                image: AssetImage("images/mountain.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10 / 2,
          ),
          SmallText(
            text: "icontext",
            size: Dimensions.font20,
            color: AppColor.secondaryColor,
          )
        ],
      ),
    );
  }
}
