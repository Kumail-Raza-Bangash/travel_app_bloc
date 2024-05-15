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
  int gottenStars = 4;
  int selectedIndex = -1;
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/image01.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
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
                    icon: const Icon(
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
              top: Dimensions.height45 * 8,
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
                        BigText(
                          text: "9 Pixels",
                          size: Dimensions.font30,
                        ),
                        BigText(
                          text: "\$250",
                          color: AppColor.primaryColor,
                          size: Dimensions.font30,
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height5),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColor.secondaryColor,
                        ),
                        SizedBox(width: Dimensions.width10 / 2),
                        SmallText(
                          text: "Lahore, Pakistan",
                          size: Dimensions.font15,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                color: index < gottenStars
                                    ? AppColor.secondaryColor
                                    : AppColor.greyColor,
                              );
                            },
                          ),
                        ),
                        SmallText(
                          text: "(4.0)",
                          size: Dimensions.font15,
                        ),
                      ],
                    ),
                    // end Top Texts
                    SizedBox(height: Dimensions.height30),
                    BigText(
                      text: "People",
                      size: Dimensions.font25,
                    ),
                    SmallText(
                      text: "Number of people in your group",
                      size: Dimensions.font15,
                    ),
                    SizedBox(height: Dimensions.height10),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: AppButton(
                              text: (index + 1).toString(),
                              //icon: Icons.headphones,
                              isIcon: false,
                              color: AppColor.whiteColor,
                              backgroundColor: selectedIndex == index
                                  ? AppColor.primaryColor
                                  : AppColor.secondaryColor,
                              borderColor: selectedIndex == index
                                  ? AppColor.primaryColor
                                  : AppColor.secondaryColor,
                              size: Dimensions.height10 * 6,
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: Dimensions.height20),
                    // Description
                    BigText(
                      text: "Description",
                      size: Dimensions.font25,
                    ),
                    SmallText(
                      text:
                          "You must go for a travel. Travelling helps get rid of pressure. Go to mountains to see the nature.",
                      size: Dimensions.font15,
                    ),
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
