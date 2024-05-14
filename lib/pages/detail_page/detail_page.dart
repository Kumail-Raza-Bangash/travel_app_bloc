import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app_bloc/app_constants/colors.dart';
import 'package:travel_app_bloc/app_constants/dimensions.dart';
import 'package:travel_app_bloc/widgets/app_button.dart';
import 'package:travel_app_bloc/widgets/big_text.dart';
import 'package:travel_app_bloc/widgets/small_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectText = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            // Top Image
            Positioned(
              left: Dimensions.width20 * 0,
              right: Dimensions.height45 * 0,
              top: Dimensions.height45 * 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.height45 * 10,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/image01.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                  ),
                ),
              ),
            ),
            //end Top Image

            // Top Icon
            Positioned(
              left: Dimensions.width20,
              top: Dimensions.height45,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                    ),
                    color: AppColor.whiteColor,
                  )
                ],
              ),
            ),
            //end Top Icon

            //Bottom Content
            Positioned(
              top: Dimensions.height45 * 9,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height30,
                ),
                height: Dimensions.height45 * 12,
                width: Dimensions.screenWidth,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius30),
                    topRight: Radius.circular(Dimensions.radius30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(text: "Text"),
                        BigText(
                          text: "\$250",
                          color: AppColor.primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height10 / 2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColor.secondaryColor,
                        ),
                        SizedBox(width: Dimensions.width10 / 2),
                        SmallText(text: "Lahore, Pakistan"),
                      ],
                    ),
                    SizedBox(height: Dimensions.height10 / 2),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? AppColor.secondaryColor
                                  : AppColor.greyColor,
                            );
                          }),
                        ),
                        SmallText(text: "(5.0)"),
                      ],
                    ),
                    // end Top Texts
                    SizedBox(height: Dimensions.height30),
                    BigText(
                      text: "People",
                      size: Dimensions.font26,
                    ),
                    SmallText(text: "Number of people in your group"),
                    SizedBox(height: Dimensions.height20),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) {
                          return AppButton(
                            text: (index + 1).toString(),
                            //icon: Icons.headphones,
                            isIcon: false,
                            color: AppColor.whiteColor,
                            backgroundColor: index < selectText
                                ? AppColor.primaryButtonColor
                                : AppColor.secondaryColor,
                            borderColor: index < selectText
                                ? AppColor.primaryButtonColor
                                : AppColor.secondaryColor,
                            size: Dimensions.height30 * 2,
                          );
                        },
                      ),
                    ),

                    // Description

                    // end Description
                  ],
                ),
              ),
            ),
            //end Bottom Content
          ],
        ),
      ),
    );
  }
}
