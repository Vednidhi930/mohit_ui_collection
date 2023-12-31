import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
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
import 'T5SetFingerPrint.dart';

class T5SetPassword extends StatefulWidget {
  static String tag = '/T5SetPassword';

  @override
  T5SetPasswordState createState() => T5SetPasswordState();
}

class T5SetPasswordState extends State<T5SetPassword> {
  @override
  Widget build(BuildContext context) {
    var width = context.width();
    var height = context.height();

    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: height,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  commonCachedNetworkImage(t5_ragistration,
                      width: width / 2.5, height: width / 2.5),
                  SizedBox(height: 30),
                  text(t5_lbl_set_pawd,
                      textColor: appStore.textPrimaryColor,
                      fontFamily: fontBold,
                      fontSize: 22.0),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.all(24),
                    decoration: boxDecoration(
                        bgColor: context.scaffoldBackgroundColor,
                        showShadow: true,
                        radius: 4),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 10),
                        EditText(hint: t5_hint_password, isSecure: true),
                        SizedBox(height: 16),
                        EditText(
                            hint: t5_hint_confirm_password, isSecure: true),
                        SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            T5SetFingerPrint().launch(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: width / 8,
                            child: text(t5_continue,
                                textColor: t5White, isCentered: true),
                            decoration: boxDecoration(
                                bgColor: t5ColorPrimary, radius: 24),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          TopBar()
        ],
      ),
    );
  }
}
