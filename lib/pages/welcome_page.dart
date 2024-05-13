import 'package:flutter/material.dart';
import 'package:travel_app_bloc/app_constants/colors.dart';
import 'package:travel_app_bloc/app_constants/dimensions.dart';
import 'package:travel_app_bloc/widgets/big_text.dart';
import 'package:travel_app_bloc/widgets/responsive_button.dart';
import 'package:travel_app_bloc/widgets/small_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome_one.jpg",
    "welcome_two.jpg",
    "welcome_three.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/${images[index]}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height10 * 10,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: "Trip",
                          size: Dimensions.font20 * 2,
                          color: AppColor.primaryColor,
                        ),
                        SmallText(
                          text: "Mountain",
                          size: Dimensions.font20 * 2,
                        ),
                        SizedBox(height: Dimensions.height20),
                        SizedBox(
                          width: Dimensions.width30 * 10,
                          child: SmallText(
                            text:
                                "We spent the afternoon hiking around the lake. She hiked 10 miles in the hot desert sun. We hiked some of the shorter trails",
                            size: Dimensions.font20,
                          ),
                        ),
                        SizedBox(height: Dimensions.height45),
                        ResponsiveButton(
                          width: Dimensions.width30 * 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
