import 'package:flutter/material.dart';
import 'package:my_app/misc/colors.dart';
import 'package:my_app/pages/navpages/bar_item_page.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/navpages/my_page.dart';
import 'package:my_app/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(Icons.grid_view_rounded)),
          BottomNavigationBarItem(
              label: "Bar", icon: Icon(Icons.bar_chart_outlined)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              label: "Profile", icon: Icon(Icons.person_outline)),
        ],
      ),
    );
  }
}
