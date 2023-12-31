import 'package:flutter/material.dart';
import 'package:mohit_ui_collection/const/colors.dart';
import 'package:mohit_ui_collection/const/consts.dart';
import 'package:mohit_ui_collection/d/themes/theme1/screen/t1_walk/IntroScreen.dart';

import '../../../../main/AppWidget.dart';
import '../../theme1/utils/T1Constant.dart';
import '../../theme1/screen/t1_walk/Walkthrough.dart';
import '../utils/T1Colors.dart';
import '../utils/T1DataGenerator.dart';
import '../utils/T1Images.dart';
import 'T1Signup.dart';

class T1WalkThrough extends StatelessWidget {
  static var tag = "/T1WalkThrough";

  final List<Walkthrough> list = [
    Walkthrough(
        title: "Add Files",
        content: Mohit_UI_KitShortText,
        imageIcon: t1_walk1),
    Walkthrough(
        title: "Select Files",
        content: Mohit_UI_KitShortText,
        imageIcon: t1_walk2),
    Walkthrough(
        title: "Share Files",
        content: Mohit_UI_KitShortText,
        imageIcon: t1_walk3),
  ];

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appBarBackgroundColor);
    return Scaffold(
      body: Container(
        child: IntroScreen(
          list,
          MaterialPageRoute(builder: (context) => T1Signup()),
        ),
      ),
    );
  }
}
