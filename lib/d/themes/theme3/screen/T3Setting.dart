import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/main/AppStore.dart';

import '../../../../const/consts.dart';
import '../../../../main/AppWidget.dart';
import '../model/T3_Model.dart';
import '../utils/T3BottomNavigationBar.dart';
import '../utils/T3DataGenerator.dart';
import '../utils/T3Images.dart';
import '../utils/T3widgets.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import 'T3Dashboard.dart';
import 'T3Listing.dart';

class T3Setting extends StatefulWidget {
  static String tag = '/T3Setting';

  @override
  T3SettingState createState() => T3SettingState();
}

class T3SettingState extends State<T3Setting> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      appBar: appBar(context, t3_lbl_setting),
      body: SafeArea(
        child: Container(
          color: context.scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(t3_lbl_language, style: boldTextStyle(size: 14)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage(t3_ic_flag), radius: 6),
                        Container(
                            margin: EdgeInsets.only(left: 4, right: 12),
                            child: Text(t3_lbl_French,
                                style: primaryTextStyle(size: 14))),
                        Text(t3_lbl_change, style: primaryTextStyle(size: 14)),
                      ],
                    ),
                  ],
                ),
              ),
              divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(t3_hint_password, style: boldTextStyle(size: 14)),
                    Text(t3_lbl_change, style: primaryTextStyle(size: 14)),
                  ],
                ),
              ),
              divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(t3_lbl_location, style: boldTextStyle(size: 14)),
                    Text(t3_lbl_edit, style: primaryTextStyle(size: 14)),
                  ],
                ),
              ),
              divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 4, 6, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(t3_lbl_receive_notification,
                        style: boldTextStyle(size: 14)),
                    Switch(
                      value: isSwitched1,
                      onChanged: (value) {
                        setState(() {
                          isSwitched1 = value;
                        });
                      },
                      activeTrackColor: Colors.amber,
                      activeColor: t3_view_color,
                    )
                  ],
                ),
              ),
              divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 4, 6, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(t3_lbl_receive_newsletter,
                        style: boldTextStyle(size: 14)),
                    Switch(
                      value: isSwitched2,
                      onChanged: (value) {
                        setState(() {
                          isSwitched2 = value;
                        });
                      },
                      activeTrackColor: Colors.amber,
                      activeColor: t3_view_color,
                    )
                  ],
                ),
              ),
              divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 4, 6, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(t3_lbl_receive_special_news_offer,
                        style: boldTextStyle(size: 14)),
                    Switch(
                      value: isSwitched3,
                      onChanged: (value) {
                        setState(() {
                          isSwitched3 = value;
                        });
                      },
                      activeTrackColor: Colors.amber,
                      activeColor: t3_view_color,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
