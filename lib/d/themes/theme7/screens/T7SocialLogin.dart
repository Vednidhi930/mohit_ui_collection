import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohit_ui_collection/d/themes/theme14/utils/T14Images.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppConstant.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../models/T7Models.dart';
import '../utils/T7BottomNavigationBar.dart';
import '../utils/T7Colors.dart';
import '../utils/T7DataGenerator.dart';
import '../utils/T7Images.dart';
import '../utils/T7Strings.dart';
import '../utils/T7Widget.dart';

class T7SocialLogin extends StatefulWidget {
  static String tag = '/T7SocialLogin';

  @override
  T7SocialLoginState createState() => T7SocialLoginState();
}

class T7SocialLoginState extends State<T7SocialLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          commonCacheImageWidget(
            t14_travel3,
            fit: BoxFit.fill,
            width: context.width(),
            context.height(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: 60),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: text(t7_trip_go,
                      textColor: t7white, fontSize: textSizeXLarge),
                ),
                decoration: boxDecoration(radius: 12, bgColor: t7_black_trans)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  btn(t7white, t7_google_fill, t7_login_with_google, t7black,
                      t7black),
                  SizedBox(height: 30),
                  btn(t7form_facebook, t7_facebook_fill, t7_login_with_facebook,
                      t7white, t7white),
                  SizedBox(height: 30),
                  btn(t7white, t7_ic_apple, t7_login_with_apple, t7black,
                      t7black),
                  SizedBox(height: 30),
                  text(t7_or, textColor: t7white),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: T7Button(
                        textContent: t7_login,
                        onPressed: () {},
                        bgColor: t7black,
                      )),
                      SizedBox(width: 30),
                      Expanded(
                          child: T7Button(
                              textContent: t7_sign_up,
                              onPressed: () {},
                              bgColor: t7white)),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget btn(var bgColor, var icon, var value, var txtColor, var iconColor) {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
    decoration: boxDecoration(bgColor: bgColor, radius: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SvgPicture.network(
          icon,
          color: iconColor,
        ),
        Expanded(
            child: Text(value,
                style: TextStyle(
                    color: txtColor,
                    fontSize: textSizeMedium,
                    fontFamily: fontRegular),
                textAlign: TextAlign.center))
      ],
    ),
  );
}
