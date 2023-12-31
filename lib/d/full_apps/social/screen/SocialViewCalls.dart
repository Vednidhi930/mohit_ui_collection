import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../model/SocialModel.dart';
import '../utils/SocialColors.dart';
import '../utils/SocialConstant.dart';
import '../utils/SocialDataGenerator.dart';
import '../utils/SocialImages.dart';
import '../utils/SocialStrings.dart';
import '../utils/SocialWidget.dart';
import 'SocialHomeCalls.dart';

class SocialViewCall extends StatefulWidget {
  static String tag = '/SocialViewCall';

  @override
  SocialViewCallState createState() => SocialViewCallState();
}

class SocialViewCallState extends State<SocialViewCall> {
  late List<SocialUser> mList;

  @override
  void initState() {
    super.initState();
    mList = addCallData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn
          ? scaffoldDarkColor
          : social_app_background_color,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mTop(context, ""),
            Container(
              decoration: boxDecoration(radius: spacing_middle),
              padding: EdgeInsets.all(spacing_middle),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Calls(mList[index], index);
                    // return Chats(mListings[index], index);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
