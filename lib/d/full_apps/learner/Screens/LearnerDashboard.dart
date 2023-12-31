import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import '../utils/LearnerBottomNavigationBar.dart';
import '../utils/LearnerColors.dart';
import '../utils/LearnerDataGenerator.dart';
import '../utils/LearnerImages.dart';
import '../utils/LearnerStrings.dart';
import 'LearnerChart.dart';
import 'LearnerChat.dart';
import 'LearnerHome.dart';
import 'LearnerProfile.dart';
import 'LearnerSearch.dart';

class LearnerDashboard extends StatefulWidget {
  static String tag = '/LearnerDashboard';

  @override
  _LearnerDashboardState createState() => _LearnerDashboardState();
}

class _LearnerDashboardState extends State<LearnerDashboard> {
  var selectedIndex = 0;
  var pages = [
    LearnerHome(),
    LearnerSearch(),
    LearnerChart(),
    LearnerChat(),
    LearnerProfile(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
      if (selectedIndex == 0) {
        print("Home");
      } else if (selectedIndex == 1) {
        print("Search");
      } else if (selectedIndex == 2) {
        print("Chart");
      } else if (selectedIndex == 3) {
        print("Chat");
      } else if (selectedIndex == 4) {
        print("Profile");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: learner_layout_background,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: learner_ShadowColor,
                offset: Offset.fromDirection(3, 1),
                spreadRadius: 1,
                blurRadius: 5)
          ]),
          child: LearnerBottomNavigationBar(
            items: <LearnerBottomNavigationBarItem>[
              LearnerBottomNavigationBarItem(icon: Learner_ic_home_navigation),
              LearnerBottomNavigationBarItem(
                  icon: Learner_ic_search_navigation),
              LearnerBottomNavigationBarItem(icon: Learner_ic_chart_navigation),
              LearnerBottomNavigationBarItem(
                  icon: Learner_ic_message_navigation),
              LearnerBottomNavigationBarItem(icon: Learner_ic_more_navigation),
            ],
            currentIndex: selectedIndex,
            unselectedIconTheme:
                IconThemeData(color: learner_textColorSecondary, size: 24),
            selectedIconTheme:
                IconThemeData(color: learner_colorPrimary, size: 24),
            onTap: _onItemTapped,
            type: LearnerBottomNavigationBarType.fixed,
          ),
        ),
        body: SafeArea(
          child: pages[selectedIndex],
        ),
      ),
    );
  }
}
