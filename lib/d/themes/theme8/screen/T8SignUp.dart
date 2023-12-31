import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../const/colors.dart';
import '../../../../main/AppConstant.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../../../main/utils/percent_indicator/circular_percent_indicator.dart';
import '../model/T8Models.dart';
import '../utils/T8Colors.dart';
import '../utils/T8DataGenerator.dart';
import '../utils/T8Images.dart';
import '../utils/T8Strings.dart';
import '../utils/T8Widget.dart';

class T8SignUp extends StatefulWidget {
  static String tag = '/T8SignUp';

  @override
  T8SignUpState createState() => T8SignUpState();
}

class T8SignUpState extends State<T8SignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(context.scaffoldBackgroundColor);

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: context.height(),
              color: context.scaffoldBackgroundColor,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 24),
                  text(t8_title_new_account,
                      textColor: appStore.textPrimaryColor,
                      fontSize: textSizeNormal,
                      fontFamily: fontBold),
                  text(t8_info_sign_up,
                      textColor: appStore.textSecondaryColor,
                      isLongText: true,
                      isCentered: true),
                  Container(
                    margin: EdgeInsets.all(24.0),
                    decoration: boxDecoration(
                        bgColor: context.scaffoldBackgroundColor,
                        showShadow: true,
                        radius: 10),
                    child: Column(
                      children: <Widget>[
                        d8EditTextStyle(t8_hint_your_email, isPassword: false),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  text(t8_lbl_already_have_an_account,
                      textColor: appStore.textSecondaryColor),
                  text(t8_lbl_sign_in,
                      textColor: t8_colorPrimary, textAllCaps: true),
                  SizedBox(height: 80),
                  Container(
                      margin: EdgeInsets.all(24.0),
                      child: T8Button(
                          textContent: t8_lbl_create_account, onPressed: () {}))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
