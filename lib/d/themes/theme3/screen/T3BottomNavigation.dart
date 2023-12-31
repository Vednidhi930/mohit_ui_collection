import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/main/AppStore.dart';

import '../../../../main/AppWidget.dart';
import '../utils/T3BottomNavigationBar.dart';
import '../utils/T3Images.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';

class T3BottomNavigation extends StatefulWidget {
  static var tag = "/T3BottomNavigation";

  @override
  T3BottomNavigationState createState() => T3BottomNavigationState();
}

class T3BottomNavigationState extends State<T3BottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      appBar: appBar(context, t3_lbl_bottom_navigation),
      body: SafeArea(
        child: Observer(
          builder: (_) => Container(
            color: context.scaffoldBackgroundColor,
            width: context.width(),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 180,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150.0),
                          border: Border.all(
                            width: 16.0,
                            color: t3_colorPrimary,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(t3_lbl_welcome_to_bottom_n_navigation_bar,
                          style: boldTextStyle(size: 16),
                          maxLines: 2,
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: context.scaffoldBackgroundColor,
        child: CurvedNavigationBar(
          backgroundColor: context.scaffoldBackgroundColor,
          color: appStore.appBarColor,
          items: <Widget>[
            SvgPicture.network(t3_ic_home,
                height: 24,
                width: 24,
                fit: BoxFit.none,
                color: appStore.iconColor),
            SvgPicture.network(t3_ic_msg,
                height: 24,
                width: 24,
                fit: BoxFit.none,
                color: appStore.iconColor),
            SvgPicture.network(t3_notification,
                height: 24,
                width: 24,
                fit: BoxFit.none,
                color: appStore.iconColor),
            SvgPicture.network(t3_ic_user,
                height: 24,
                width: 24,
                fit: BoxFit.none,
                color: appStore.iconColor),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }
}
