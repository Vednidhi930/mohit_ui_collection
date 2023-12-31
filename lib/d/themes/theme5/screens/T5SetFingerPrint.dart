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

class T5SetFingerPrint extends StatefulWidget {
  static String tag = '/T5SetFingerPrint';

  @override
  T5SetFingerPrintState createState() => T5SetFingerPrintState();
}

class T5SetFingerPrintState extends State<T5SetFingerPrint> {
  @override
  Widget build(BuildContext context) {
    var width = context.width();
    var height = context.height();
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
                  commonCachedNetworkImage(t5_login,
                      width: width / 2.5, height: width / 2.5),
                  text(t5_lbl_fingerprint,
                      textColor: appStore.textPrimaryColor,
                      fontFamily: fontBold,
                      fontSize: 22.0),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 16),
                    child: text(t5_note_finger_set,
                        textColor: t5TextColorSecondary,
                        fontFamily: fontMedium,
                        fontSize: textSizeMedium,
                        maxLine: 2,
                        isCentered: true),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                      onTap: () {},
                      child: SvgPicture.network(t5_img_fingerprint,
                          width: width / 3.5, color: t5ColorPrimary)),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      finish(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(24),
                      alignment: Alignment.center,
                      height: width / 8,
                      child: text(t5_continue,
                          textColor: t5White, isCentered: true),
                      decoration:
                          boxDecoration(bgColor: t5ColorPrimary, radius: 24),
                    ),
                  ),
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
