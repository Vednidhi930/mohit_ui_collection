import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../models/T10Models.dart';
import '../utils/T10Colors.dart';
import '../utils/T10DataGenerator.dart';
import '../utils/T10Images.dart';
import '../utils/T10Strings.dart';
import '../utils/T10Constant.dart';
import '../utils/T10Widget.dart';

class T10SignIn extends StatefulWidget {
  static String tag = '/T10SignIn';

  @override
  T10SignInState createState() => T10SignInState();
}

class T10SignInState extends State<T10SignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: context.height(),
          color: context.scaffoldBackgroundColor,
          margin: EdgeInsets.only(left: spacing_large, right: spacing_large),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              text(theme10_lbl_welcome,
                  textColor: appStore.textPrimaryColor,
                  fontFamily: fontBold,
                  fontSize: textSizeXLarge),
              SizedBox(height: spacing_large),
              EditText(
                text: theme10_username,
                isPassword: false,
              ),
              SizedBox(height: spacing_standard_new),
              EditText(
                text: theme10_password,
                isSecure: true,
              ),
              SizedBox(height: spacing_xlarge),
              AppButtons(
                onPressed: () {},
                textContent: theme10_lbl_sign_in,
              ),
              SizedBox(height: spacing_large),
              text(theme10_lbl_forget_pswd,
                  textColor: t10_textColorSecondary, fontFamily: fontMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text(theme10_lbl_dont_have_account,
                      textColor: t10_textColorSecondary,
                      fontFamily: fontMedium),
                  SizedBox(
                    width: spacing_control,
                  ),
                  text(theme10_lbl_sign_up, fontFamily: fontMedium),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
