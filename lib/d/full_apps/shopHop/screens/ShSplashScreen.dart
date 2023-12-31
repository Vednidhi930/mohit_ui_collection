import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../utils/ShImages.dart';
import '../utils/ShWidget.dart';
import '../utils/ShColors.dart';
import 'ShWalkThroughScreen.dart';

class ShSplashScreen extends StatefulWidget {
  static String tag = '/shophop';

  @override
  ShSplashScreenState createState() => ShSplashScreenState();
}

class ShSplashScreenState extends State<ShSplashScreen> {
  @override
  void initState() {
    super.initState();
    changeStatusColor(Colors.transparent);
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    finish(context);
    ShWalkThroughScreen().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    return Scaffold(
      body: Container(
        width: width + width * 0.4,
        child: Stack(
          children: <Widget>[
            commonCachedNetworkImage(
              splash_bg,
              width: context.width(),
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: -width * 0.2,
              left: -width * 0.2,
              child: Container(
                width: width * 0.65,
                height: width * 0.65,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: sh_colorPrimary.withOpacity(0.3)),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  commonCachedNetworkImage(ic_app_icon, width: width * 0.3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Shop",
                          style: boldTextStyle(
                              color: sh_textColorPrimary,
                              size: 35,
                              fontFamily: 'Bold')),
                      Text("hop",
                          style: boldTextStyle(
                              color: sh_colorPrimary,
                              size: 35,
                              fontFamily: 'Bold')),
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: -width * 0.2,
                    right: -width * 0.2,
                    child: Container(
                      width: width * 0.65,
                      height: width * 0.65,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: sh_colorPrimary.withOpacity(0.3)),
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: commonCachedNetworkImage(splash_img,
                    width: width * 0.5, height: width * 0.5))
          ],
        ),
      ),
    );
  }
}
