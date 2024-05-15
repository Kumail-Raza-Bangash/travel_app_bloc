// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc/app_constants/colors.dart';
import 'package:travel_app_bloc/app_constants/dimensions.dart';
import 'package:travel_app_bloc/cubit/app_cubit_states.dart';
import 'package:travel_app_bloc/cubit/app_cubits.dart';
import 'package:travel_app_bloc/widgets/big_text.dart';
import 'package:travel_app_bloc/widgets/icon_text.dart';
import 'package:travel_app_bloc/widgets/small_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top AppBar
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height30 * 2,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 30,
                        color: AppColor.primaryColor,
                      ),
                      Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15 / 2),
                          color: AppColor.secondaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                // end Top AppBar

                SizedBox(height: Dimensions.height30),
                // Discover Text
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: BigText(
                    text: "Discover",
                    size: Dimensions.font30,
                  ),
                ),
                // end Discover Text

                SizedBox(height: Dimensions.height20),
                // Tabbar
                SizedBox(
                  child: TabBar(
                    controller: _tabController,
                    labelPadding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    labelColor: AppColor.primaryColor,
                    unselectedLabelColor: AppColor.secondaryColor,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppColor.primaryColor,
                    indicator: CircleTabIndicator(
                        color: AppColor.primaryColor, radius: 3),
                    tabs: const [
                      Tab(text: "Places"),
                      Tab(text: "Inspiration"),
                      Tab(text: "Emotions"),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.height45 * 8,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: Dimensions.width20 * 10,
                            margin: EdgeInsets.all(Dimensions.radius5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              color: AppColor.whiteColor,
                              image: DecorationImage(
                                image: NetworkImage(
                                  "http://mark.bslmeiyu.com/uploads/${info[index].img}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      const Text("There"),
                      const Text("Bye"),
                    ],
                  ),
                ),
                // end Tabbar

                SizedBox(height: Dimensions.height45),
                // Explore more
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: "Explore more",
                        size: Dimensions.font20,
                        color: AppColor.primaryColor,
                      ),
                      SmallText(
                        text: "See all",
                        color: AppColor.secondaryColor,
                        size: Dimensions.font15,
                      ),
                    ],
                  ),
                ),
                // end Explore more

                SizedBox(height: Dimensions.height10),
                // Bottom Icons
                SizedBox(
                  height: Dimensions.height30 * 4,
                  child: IconAndText(),
                )
                // end Bottom Icons
              ],
            );
          } else {
            return Container(
              child: Center(
                child: Text("Error"),
              ),
            );
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePanter(color: color, radius: radius);
  }
}

class _CirclePanter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePanter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
      configuration.size!.width / 2,
      configuration.size!.height - 10,
    );

    final Offset circleOffset1 = Offset(
      configuration.size!.width / 2 + 10,
      configuration.size!.height - 10,
    );
    final Offset circleOffset2 = Offset(
      configuration.size!.width / 2 - 10,
      configuration.size!.height - 10,
    );

    canvas.drawCircle(offset + circleOffset, radius, _paint);
    canvas.drawCircle(offset + circleOffset1, radius, _paint);
    canvas.drawCircle(offset + circleOffset2, radius, _paint);
  }
}
