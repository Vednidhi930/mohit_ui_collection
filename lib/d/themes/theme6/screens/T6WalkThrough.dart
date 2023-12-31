import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mohit_ui_collection/d/themes/theme12/utils/t12_images.dart';

import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../../../main/utils/dots_indicator/src/dots_decorator.dart';
import '../../../../main/utils/dots_indicator/src/dots_indicator.dart';

import '../utils/T6Colors.dart';
import '../utils/T6DataGenerator.dart';
import '../utils/T6Images.dart';
import '../utils/T6Strings.dart';
import '../utils/T6Constant.dart';
import '../utils/T6Widget.dart';
import '../utils/Widget/T6Bar.dart';
import '../utils/Widget/T6SliderWidget.dart';
import 'T6SignIn.dart';

class T6WalkThrough extends StatefulWidget {
  static String tag = '/walk_through6';

  @override
  T6WalkThroughState createState() => T6WalkThroughState();
}

class T6WalkThroughState extends State<T6WalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;

  var titles = [
    "M kit – Biggest Flutter UI kit is the ultimate library of Flutter UI templates",
    "M kit – Biggest Flutter UI kit is the ultimate library of Flutter UI templates",
  ];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = 2;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: text("Skip",
                    textAllCaps: true,
                    textColor: t6colorPrimary,
                    fontFamily: fontMedium),
              )),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: context.width(),
            height: context.height(),
            child: PageView(
              children: <Widget>[
                WalkThrough(textContent: t12_walk, title: t6_sample_text),
                WalkThrough(textContent: t12_walk, title: t6_sample_text),
              ],
              onPageChanged: (value) {
                setState(() => currentIndexPage = value);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                  child: new DotsIndicator(
                      dotsCount: 2,
                      position: currentIndexPage,
                      decorator: DotsDecorator(
                        color: t6view_color,
                        activeColor: t6colorPrimary,
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                T6Button(
                  textContent: t6_lbl_let_s_get_started,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    ));
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

    return Container(
      width: context.width(),
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: commonCachedNetworkImage(textContent,
                height: (context.height()) / 2.5),
          ),
          SizedBox(
            height: h * 0.08,
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                  fontSize: textSizeLargeMedium, color: t6textColorSecondary),
              textAlign: TextAlign.center,
            )),
          ),
        ],
      ),
    );
  }
}
