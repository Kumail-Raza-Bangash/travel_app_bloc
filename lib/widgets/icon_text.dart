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
    "mountain_icon.png": "Mountain",
    "ob2.png": "Mountain 2",
    "mountain.jpg": "Mountain 3",
    "ob3.png": "Mountain 4",
    "ob1.png": "Mountain 5",
  };
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(
            left: Dimensions.width10 / 2,
            right: Dimensions.width20,
            top: Dimensions.height10 / 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: Dimensions.height10 * 7,
                width: Dimensions.width10 * 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  image: DecorationImage(
                    image: AssetImage("images/${images.keys.elementAt(index)}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10 / 2,
              ),
              SmallText(
                text: images.values.elementAt(index),
                size: Dimensions.font20,
                color: AppColor.secondaryColor,
              )
            ],
          ),
        );
      },
    );
  }
}
