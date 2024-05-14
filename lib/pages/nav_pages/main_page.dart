import 'package:flutter/material.dart';
import 'package:travel_app_bloc/app_constants/colors.dart';
import 'package:travel_app_bloc/app_constants/dimensions.dart';
import 'package:travel_app_bloc/pages/nav_pages/bar_item_page.dart';
import 'package:travel_app_bloc/pages/nav_pages/home_page.dart';
import 'package:travel_app_bloc/pages/nav_pages/my_page.dart';
import 'package:travel_app_bloc/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedFontSize: Dimensions.font16,
        unselectedFontSize: 0,
        elevation: 0,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.primaryColor,
        selectedItemColor: AppColor.whiteColor,
        unselectedItemColor: AppColor.secondaryColor,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Bar", icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label: "search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "my", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
