import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mohit_ui_collection/const/colors.dart';
import 'package:mohit_ui_collection/d/themes/theme14/utils/T14Images.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../../theme1/utils/T1Constant.dart';
import '../utils/T1Colors.dart';
import '../utils/T1DataGenerator.dart';
import '../utils/T1Images.dart';
import '../utils/T1Strings.dart';
import '../utils/T1Widget.dart';
import 'T1Listing.dart';

class T1Card extends StatelessWidget {
  static var tag = "/T1Cards";

  Widget counter(String counter, String counterName) {
    return Column(
      children: <Widget>[
        profile(counter),
        text(counterName,
            textColor: textPrimaryColor,
            fontSize: textSizeMedium,
            fontFamily: fontMedium),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appBarBackgroundColor);
    return Scaffold(
      appBar: appBar(context, t1_card_title),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          padding: EdgeInsets.only(top: 90),
          physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 55.0),
                      decoration: boxDecoration(
                          bgColor: context.scaffoldBackgroundColor,
                          radius: 10,
                          showShadow: true),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 50),
                            text(t1_user_name,
                                textColor: textPrimaryColor,
                                fontSize: textSizeNormal,
                                fontFamily: fontMedium),
                            text(t1_user_email,
                                textColor: t1_colorPrimary,
                                fontSize: textSizeMedium,
                                fontFamily: fontMedium),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: view(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                counter("100", t1_lbl_document),
                                counter("50", "Photos"),
                                counter("60", "Videos"),
                              ],
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: new EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: FractionalOffset.center,
                        child: new CircleAvatar(
                          backgroundImage: AssetImage(t14_profile4),
                          radius: 50,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 16),
              T1ListItem(getListings()[0], 1)
            ],
          ),
        ),
      ),
    );
  }
}
