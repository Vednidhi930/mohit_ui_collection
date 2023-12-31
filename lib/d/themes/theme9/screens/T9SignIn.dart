import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mohit_ui_collection/d/themes/theme14/utils/T14Images.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../main/AppConstant.dart';
import '../../../../main/AppWidget.dart';
import '../utils/T9Images.dart';
import '../utils/T9Colors.dart';
import '../utils/T9Strings.dart';
import '../utils/T9Widget.dart';

class T9SignIn extends StatefulWidget {
  static String tag = '/T9SignIn';

  @override
  T9SignInState createState() => T9SignInState();
}

class T9SignInState extends State<T9SignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(context.scaffoldBackgroundColor);
    var width = context.width();
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              width: context.width(),
              height: 50,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: t9_colorPrimary),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: t9_white, width: 4)),
                      child: CircleAvatar(
                          backgroundImage: AssetImage(t14_profile3),
                          radius: width / 7),
                    ),
                    SizedBox(height: 30),
                    T9EditTextStyle(t9_hint_email, isPassword: false),
                    SizedBox(height: 16),
                    T9EditTextStyle(t9_hint_password, isPassword: true),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 120,
                        alignment: Alignment.center,
                        child: T9Button(
                          onPressed: () {},
                          textContent: t9_lbl_enter,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              width: context.width(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text(t9_lbl_don_t_joined_yet),
                  SizedBox(
                    width: 8,
                  ),
                  text(t9_lbl_join, textColor: t9_colorPrimary)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
