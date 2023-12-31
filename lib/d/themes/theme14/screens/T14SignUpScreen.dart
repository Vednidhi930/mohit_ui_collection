import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../main/AppStore.dart';
import 'package:intl/intl.dart';
import '../../../../const/strings.dart';

import '../../../../main/AppWidget.dart';
import '../../../../main/utils/codePicker/country_code_picker.dart';
import '../../../../main/utils/flutterCalender/CleanCalendar.dart';
import '../model/T14Model.dart';
import '../utils/CustomCalender.dart';
import '../utils/T14Colors.dart';
import '../utils/T14DataGenerator.dart';
import '../utils/T14Images.dart';
import '../utils/T14Strings.dart';
import '../utils/T14Widget.dart';
import 'T14ChattingScreen.dart';

class T14SignUpScreen extends StatefulWidget {
  @override
  _T14SignUpScreenState createState() => _T14SignUpScreenState();
}

class _T14SignUpScreenState extends State<T14SignUpScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: t14_colorWhite,
        automaticallyImplyLeading: false,
        title: Text(t14_txt_Registration,
            style: boldTextStyle(color: t14_colorBlue, size: 16)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            t14_txt_Registration_title,
            textAlign: TextAlign.center,
            style: boldTextStyle(color: t14_colorBlue, size: 20),
          ).paddingOnly(top: 40, left: 40, right: 40),
          commonCachedNetworkImage(
                  "${GlobalUrl}images/themes/theme14/t14_bad.png",
                  height: 100,
                  width: 200)
              .expand(),
          t14AppButton(
            context,
            btnText: t14_txt_face_id,
            bgColor: t14_SignInBgColor,
            width: context.width(),
            shape: 10.0,
            txtColor: t14_colorSkyBlue,
          ).paddingOnly(left: 24, right: 24, bottom: 16),
          Text('No thanks',
                  textAlign: TextAlign.center,
                  style: boldTextStyle(color: t14_OppsColor, size: 12))
              .paddingOnly(bottom: 16),
        ],
      ),
    );
  }
}
