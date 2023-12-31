import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../utils/T8Colors.dart';
import '../utils/T8Images.dart';
import '../utils/T8Strings.dart';
import '../utils/T8Widget.dart';

class T8BottomNavigation extends StatefulWidget {
  static String tag = '/T8BottomNavigation';

  @override
  T8BottomNavigationState createState() => T8BottomNavigationState();
}

class T8BottomNavigationState extends State<T8BottomNavigation> {
  var isSelected = 1;

  Widget tabItem(var pos, var icon, var title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Container(
        width: context.width() * 0.25,
        height: 50,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SvgPicture.network(
              icon,
              width: context.width() * 0.07,
              height: 20,
              color: isSelected == pos ? t8_colorPrimary : t8_icon_color,
            ),
            text(
              title,
              textColor: isSelected == pos ? t8_colorPrimary : t8_icon_color,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(context.scaffoldBackgroundColor);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: t8HeaderText(t8_title_bottom_navigation)),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: t8_ShadowColor,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 3.0)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 0.0, right: 0, top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              tabItem(1, t8_ic_homes, "Home"),
              tabItem(2, t8_ic_quiz, "Quiz"),
              tabItem(3, t8_ic_user, "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
