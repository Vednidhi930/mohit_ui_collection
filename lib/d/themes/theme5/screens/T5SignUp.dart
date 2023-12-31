import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mohit_ui_collection/d/themes/theme12/utils/t12_images.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../../../main/utils/codePicker/country_code_picker.dart';
import '../../theme2/utils/T2BubbleBotoomBar.dart';
import '../model/T5Models.dart';
import '../utils/T5Colors.dart';
import '../utils/T5DataGenerator.dart';
import '../utils/T5Images.dart';
import '../utils/T5Strings.dart';
import '../utils/T5Widget.dart';
import '../utils/T5Constant.dart';
import '../utils/widgets/T5BottomBar.dart';
import '../utils/widgets/T5GridListing.dart';
import '../utils/widgets/T5Slider.dart';
import 'T5Verification.dart';

class T5SignUp extends StatefulWidget {
  static String tag = '/T5SignUp';

  @override
  T5SignUpState createState() => T5SignUpState();
}

class T5SignUpState extends State<T5SignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    var width = context.width();
    var height = context.height();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          alignment: Alignment.center,
          color: context.scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              commonCacheImageWidget(t5_login, width: width / 2.5, width / 2.5),
              text(t5_heading_login,
                  textColor: appStore.textPrimaryColor,
                  fontFamily: fontBold,
                  fontSize: 22.0),
              Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 16),
                child: text(t5_note_registration,
                    textColor: t5TextColorSecondary,
                    fontFamily: fontMedium,
                    fontSize: textSizeMedium,
                    maxLine: 2,
                    isCentered: true),
              ),
              Container(
                margin: EdgeInsets.all(24),
                decoration: boxDecoration(
                    bgColor: context.scaffoldBackgroundColor,
                    showShadow: true,
                    radius: 4.0),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: t5ViewColor, width: 0.5)),
                      child: Row(
                        children: <Widget>[
                          CountryCodePicker(onChanged: print, showFlag: false),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              style: TextStyle(
                                  fontSize: textSizeLargeMedium,
                                  fontFamily: fontRegular),
                              decoration: InputDecoration(
                                counterText: "",
                                contentPadding:
                                    EdgeInsets.fromLTRB(16, 10, 16, 10),
                                hintText: t5_hint_phone_no,
                                hintStyle: TextStyle(color: t5TextColorThird),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        T5Verification().launch(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: width / 8,
                        child: text(t5_continue,
                            textColor: t5White, isCentered: true),
                        decoration:
                            boxDecoration(bgColor: t5ColorPrimary, radius: 8.0),
                      ),
                    ),
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
