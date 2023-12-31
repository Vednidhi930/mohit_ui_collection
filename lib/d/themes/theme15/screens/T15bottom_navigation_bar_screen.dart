import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../../const/strings.dart';

import '../../../../main/AppWidget.dart';

import '../utils/T15colors.dart';
import '../utils/T15model.dart';
import 'dashboard/account_fragment.dart';
import 'dashboard/chat_fragment.dart';
import 'dashboard/favourite_fragment.dart';
import 'dashboard/home_fragment.dart';

class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  List navigationPages = [
    HomeFragment(),
    FavouriteFragment(),
    ChatFragment(),
    AccountFragment(),
  ];

  void onTimeTapped(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: navigationPages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.cardColor,
        selectedItemColor: primarycolor,
        currentIndex: selectedIndex,
        iconSize: 25,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        onTap: onTimeTapped,
        selectedLabelStyle: primaryTextStyle(),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(bottom: 4),
              child: commonCachedNetworkImage(
                  "${GlobalUrl}images/themes/theme15/icons/messenger.png",
                  height: 20,
                  color: Colors.grey),
            ),
            activeIcon: Container(
              padding: EdgeInsets.only(bottom: 4),
              child: commonCachedNetworkImage(
                  "${GlobalUrl}images/themes/theme15/icons/messenger.png",
                  height: 25,
                  color: primarycolor),
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
