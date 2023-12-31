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
import 'SocialHomeChats.dart';
import 'SocialSettings.dart';
import 'SocialStatus.dart';

class SocialDashboard extends StatefulWidget {
  static String tag = '/SocialDashboard';

  @override
  SocialDashboardState createState() => SocialDashboardState();
}

class SocialDashboardState extends State<SocialDashboard> {
  int selectedPos = 1;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    return SafeArea(
      child: Scaffold(
          floatingActionButton: selectedPos == 2
              ? Container(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      commonCachedNetworkImage(social_fab_edit,
                          width: width * 0.2, height: width * 0.2),
                      commonCachedNetworkImage(social_fab_msg,
                          width: width * 0.2, height: width * 0.2),
                    ],
                  ),
                )
              : Container(
                  width: width * 0.2,
                  height: width * 0.2,
                  alignment: Alignment.bottomRight,
                  child: commonCachedNetworkImage(social_fab_msg),
                ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                mToolbar(context, social_lbl_dashboard, social_ic_setting,
                    onTap: () {
                  SocialSetting().launch(context);
                }),
                SizedBox(height: spacing_standard_new),
                Container(
                  width: width,
                  decoration: boxDecoration(showShadow: true),
                  margin: EdgeInsets.only(
                      right: spacing_standard_new, left: spacing_standard_new),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            selectedPos = 1;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: width,
                            child: text(
                              social_lbl_chats,
                              fontFamily: fontMedium,
                              isCentered: true,
                              textColor: selectedPos == 1
                                  ? appStore.isDarkModeOn
                                      ? white
                                      : social_textColorPrimary
                                  : social_textColorSecondary,
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      Container(
                          width: 1,
                          height: width * 0.1,
                          color: social_view_color),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            selectedPos = 2;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: width,
                            child: text(social_lbl_status,
                                isCentered: true,
                                fontFamily: fontMedium,
                                textColor: selectedPos == 2
                                    ? appStore.isDarkModeOn
                                        ? white
                                        : social_textColorPrimary
                                    : social_textColorSecondary),
                          ),
                        ),
                        flex: 1,
                      ),
                      Container(
                          width: 1,
                          height: width * 0.1,
                          color: social_view_color),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPos = 3;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: width,
                            child: text(social_lbl_calls,
                                isCentered: true,
                                fontFamily: fontMedium,
                                textColor: selectedPos == 3
                                    ? appStore.isDarkModeOn
                                        ? white
                                        : social_textColorPrimary
                                    : social_textColorSecondary),
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing_standard),
                if (selectedPos == 1) SocialHomeChats(),
                if (selectedPos == 2) SocialHomeStatus(),
                if (selectedPos == 3) SocialHomeCalls()
              ],
            ),
          )),
    );
  }
}
