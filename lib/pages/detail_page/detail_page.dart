import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc/app_constants/colors.dart';
import 'package:travel_app_bloc/app_constants/dimensions.dart';
import 'package:travel_app_bloc/cubit/app_cubit_states.dart';
import 'package:travel_app_bloc/cubit/app_cubits.dart';
import 'package:travel_app_bloc/widgets/app_button.dart';
import 'package:travel_app_bloc/widgets/big_text.dart';
import 'package:travel_app_bloc/widgets/responsive_button.dart';
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
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return SizedBox(
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
                      image: NetworkImage(
                        "http://mark.bslmeiyu.com/uploads/${detail.place.img}",
                      ),
                      fit: BoxFit.cover,
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
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
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
                            text: detail.place.name!,
                            size: Dimensions.font30,
                          ),
                          BigText(
                            text: "\$${detail.place.price}",
                            color: AppColor.primaryColor,
                            size: Dimensions.font30,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColor.secondaryColor,
                          ),
                          SizedBox(width: Dimensions.width10 / 2),
                          SmallText(
                            text: detail.place.location!,
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
                                  color: index < detail.place.stars!
                                      ? AppColor.secondaryColor
                                      : AppColor.greyColor,
                                );
                              },
                            ),
                          ),
                          SmallText(
                            text: '(${detail.place.stars!.toString()})',
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
                          detail.place.people!,
                          (index) {
                            return AppButton(
                              text: (index + 1).toString(),
                              //icon: Icons.headphones,
                              isIcon: false,
                              color: AppColor.whiteColor,
                              backgroundColor:
                                  detail.place.selectedPeople == index + 1
                                      ? AppColor.primaryColor
                                      : AppColor.secondaryColor,
                              borderColor:
                                  detail.place.selectedPeople == index + 1
                                      ? AppColor.primaryColor
                                      : AppColor.secondaryColor,
                              size: Dimensions.height10 * 6,
                            );
                          },
                        ),
                      ),

                      SizedBox(height: Dimensions.height30),
                      // Description
                      BigText(
                        text: "Description",
                        size: Dimensions.font25,
                      ),
                      SmallText(
                        text: detail.place.description!,
                        size: Dimensions.font15,
                      ),
                      // end Description
                    ],
                  ),
                ),
              ),
              //end Bottom Content

              // Bottom
              Positioned(
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      color: AppColor.blackColor,
                      backgroundColor: AppColor.transparentColor,
                      borderColor: AppColor.primaryColor,
                      size: Dimensions.radius30 * 2,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    ResponsiveButton(
                      height: Dimensions.height30 * 2,
                      isResponsive: true,
                      text: 'Book Trip Now',
                      fontSize: Dimensions.font20,
                      textColor: AppColor.whiteColor,
                      color: AppColor.primaryColor,
                      borderColor: AppColor.primaryColor,
                      iconHeight: Dimensions.height20,
                    )
                  ],
                ),
              ),
              // end Bottom
            ],
          ),
        );
      },
    ));
  }
}
