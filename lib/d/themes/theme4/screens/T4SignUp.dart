import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../const/colors.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../theme1/utils/T1Widget.dart';
import '../models/T4Models.dart';
import '../utils/T4Colors.dart';
import '../utils/T4DataGenerator.dart';
import '../utils/T4Images.dart';
import '../utils/T4Constant.dart';
import '../utils/T4Strings.dart';
import '../utils/widgets/T4BottomNavigationBar.dart';
import '../utils/widgets/T4Button.dart';
import '../utils/widgets/T4EditText.dart';

class T4SignUp extends StatefulWidget {
  static String tag = '/T4SignUp';

  @override
  T4SignUpState createState() => T4SignUpState();
}

class T4SignUpState extends State<T4SignUp> {
  @override
  Widget build(BuildContext context) {
    var width = context.width();
    var height = context.height();

    changeStatusColor(Colors.transparent);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          commonCachedNetworkImage(
            t4_bg,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Color(0XD5160336), Color(0XD5160336)]),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 24, right: 24, top: height * 0.1),
                child: Column(
                  children: <Widget>[
                    commonCachedNetworkImage(
                      t4_logo,
                      width: width / 3.2,
                      color: t4_white,
                    ),
                    SizedBox(height: 40),
                    T4EditText(
                      hint: t4_hint_name,
                      isPassword: false,
                    ),
                    SizedBox(height: 24),
                    T4EditText(
                      hint: t4_hint_phone,
                      isPassword: false,
                    ),
                    SizedBox(height: 24),
                    T4EditText(
                      hint: t4_hint_Email,
                      isPassword: false,
                    ),
                    SizedBox(height: 24),
                    T4EditText(hint: t4_hint_password, isSecure: true),
                    SizedBox(height: 24),
                    T4Button(
                      textContent: t4_lbl_register_now,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
