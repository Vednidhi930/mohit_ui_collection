import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../model/T13Model.dart';
import '../utils/T13Colors.dart';
import '../utils/T13DataGenerator.dart';
import '../utils/T13Images.dart';
import '../utils/T13Constant.dart';
import '../utils/T13Strings.dart';
import '../utils/T13Widget.dart';

class T13SignUpScreen extends StatefulWidget {
  static String tag = '/T13SignUpScreen';

  @override
  T13SignUpScreenState createState() => T13SignUpScreenState();
}

class T13SignUpScreenState extends State<T13SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var width = context.width();

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                left: spacing_standard_new, right: spacing_standard_new),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                commonCacheImageWidget(t13_ic_logo, width * 0.3,
                    width: width * 0.3),
                SizedBox(height: spacing_xlarge),
                t13EditTextStyle(t13_hint_Email, isPassword: false),
                SizedBox(height: spacing_standard_new),
                t13EditTextStyle(t13_hint_password, isPassword: true),
                SizedBox(height: spacing_standard_new),
                t13EditTextStyle(t13_hint_confirm_password, isPassword: true),
                SizedBox(height: spacing_large),
                T13Button(
                    textContent: t13_lbl_sign_up,
                    onPressed: () {
                      finish(context);
                    }),
                SizedBox(height: spacing_large),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text(t13_lbl_already_member,
                        textColor: t13_textColorSecondary),
                    SizedBox(width: spacing_control),
                    text(t13_lbl_login, fontSize: 14.0, fontFamily: fontMedium),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
