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
import 'T4SignIn.dart';

class T4Dialog extends StatefulWidget {
  static var tag = "/T4Dialog";

  @override
  T4DialogState createState() => T4DialogState();
}

class T4DialogState extends State<T4Dialog> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    });
    return T4SignIn();
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      width: context.width(),
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          text("Would you like to get updates and notifications?",
              fontSize: textSizeLargeMedium,
              maxLine: 2,
              isCentered: true,
              textColor: appStore.textPrimaryColor,
              fontFamily: fontSemibold),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              T4Button(
                textContent: t4_lbl_allow,
                onPressed: () {
                  finish(context);
                },
              ),
              SizedBox(width: 24),
              T4Button(
                textContent: t4_lbl_deny,
                isStroked: true,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ));
}
