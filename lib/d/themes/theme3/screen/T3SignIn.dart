import 'package:cached_network_image/cached_network_image.dart';
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

class T3SignIn extends StatefulWidget {
  static var tag = "/T3SignIn";

  @override
  T3SignInState createState() => T3SignInState();
}

class T3SignInState extends State<T3SignIn> {
  bool passwordVisible = false;
  bool? isRemember = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Observer(
        builder: (_) => Container(
          color: context.scaffoldBackgroundColor,
          height: context.height(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: (context.height()) / 3.5,
                  child: Stack(
                    children: <Widget>[
                      commonCachedNetworkImage(t3_ic_background,
                          fit: BoxFit.fill, width: context.width()),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(t3_lbl_welcome,
                                style:
                                    boldTextStyle(size: 40, color: t3_white)),
                            SizedBox(height: 4),
                            Text(t3_lbl_back,
                                style: boldTextStyle(size: 34, color: t3_white))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 45),
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  child: commonCachedNetworkImage(t3_ic_icon,
                      height: 70, width: 70),
                ),
                t3EditTextField(t3_hint_Email, isPassword: false),
                SizedBox(height: 16),
                t3EditTextField(t3_hint_password, isPassword: true),
                SizedBox(height: 14),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Row(
                    children: <Widget>[
                      CustomTheme(
                        child: Checkbox(
                          focusColor: t3_colorPrimary,
                          activeColor: t3_colorPrimary,
                          value: isRemember,
                          onChanged: (bool? value) {
                            setState(() {
                              isRemember = value;
                            });
                          },
                        ),
                      ),
                      Text(t3_lbl_remember, style: secondaryTextStyle(size: 16))
                    ],
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: T3AppButton(
                      textContent: t3_lbl_sign_in, onPressed: () {}),
                ),
                SizedBox(height: 20),
                Text(t3_lbl_forgot_password,
                    style: secondaryTextStyle(size: 16)),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(t3_lbl_don_t_have_account, style: primaryTextStyle()),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: GestureDetector(
                          child: Text(t3_lbl_sign_up,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  decoration: TextDecoration.underline,
                                  color: t3_colorPrimary)),
                          onTap: () {}),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin:
                      EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          commonCachedNetworkImage(t3_ic_sign2,
                              height: 50, width: 70, color: appStore.iconColor),
                          Container(
                            margin: EdgeInsets.only(top: 25, left: 10),
                            child: commonCachedNetworkImage(t3_ic_sign4,
                                height: 50,
                                width: 70,
                                color: appStore.iconColor),
                          ),
                        ],
                      ),
                      Container(
                        child: commonCachedNetworkImage(t3_ic_sign1,
                            height: 80, width: 80, color: appStore.iconColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
