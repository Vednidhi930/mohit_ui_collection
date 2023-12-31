import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohit_ui_collection/d/themes/theme14/utils/T14Images.dart';

import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../../../main/utils/dots_indicator/src/dots_decorator.dart';
import '../../../../main/utils/dots_indicator/src/dots_indicator.dart';
import '../model/T13Model.dart';
import '../utils/T13Colors.dart';
import '../utils/T13DataGenerator.dart';
import '../utils/T13Images.dart';
import '../utils/T13Constant.dart';
import '../utils/T13Strings.dart';
import '../utils/T13Widget.dart';

class T13WalkThroughScreen extends StatefulWidget {
  static String tag = '/T13WalkThroughScreen';

  @override
  T13WalkThroughScreenState createState() => T13WalkThroughScreenState();
}

class T13WalkThroughScreenState extends State<T13WalkThroughScreen> {
  int currentIndexPage = 0;
  int? pageLength;

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = 3;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 100,
            child: Center(
              child: Container(
                width: context.width(),
                alignment: Alignment.center,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndexPage,
                  decorator: DotsDecorator(
                    size: Size.square(6.0),
                    activeSize: Size.square(10.0),
                    color: t13_view_color,
                    activeColor: t13_colorPrimary,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: context.width(),
            height: context.height(),
            child: PageView(
              children: <Widget>[
                WalkThrough(
                    textContent: t14_travel2, title: t13_lbl_simple_text),
                WalkThrough(
                    textContent: t14_travel1, title: t13_lbl_simple_text),
                WalkThrough(
                    textContent: t14_travel3, title: t13_lbl_simple_text),
              ],
              onPageChanged: (value) {
                setState(() => currentIndexPage = value);
              },
            ),
          ),
          Container(
            width: context.width(),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: context.width(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[t13_colorPrimary, t13_color_gradient1]),
              ),
              padding: EdgeInsets.all(16.0),
              child: text(t13_lbl_get_started,
                  textColor: t13_white,
                  fontFamily: fontMedium,
                  isCentered: true),
            ).onTap(() {
              finish(context);
            }),
          ),
        ],
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;
  final String title;

  WalkThrough({Key? key, required this.textContent, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = context.height();
    var w = context.width();

    return Container(
      width: w,
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          commonCacheImageWidget(textContent, context.height() * 0.5,
              width: w, fit: BoxFit.cover),
          SizedBox(height: h * 0.05),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                text("Welcome",
                    textColor: appStore.textPrimaryColor,
                    fontFamily: fontBold,
                    fontSize: textSizeNormal),
                SizedBox(height: 8),
                text(title,
                    textColor: appStore.textSecondaryColor,
                    fontSize: textSizeLargeMedium,
                    isCentered: true,
                    maxLine: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
