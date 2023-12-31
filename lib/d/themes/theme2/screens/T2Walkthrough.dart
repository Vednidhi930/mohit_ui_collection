import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mohit_ui_collection/const/consts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../const/colors.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/utils/dots_indicator/src/dots_decorator.dart';
import '../../../../main/utils/dots_indicator/src/dots_indicator.dart';
import '../models/models.dart';
import '../utils/T2BubbleBotoomBar.dart';
import '../utils/T2Colors.dart';
import '../utils/T2DataGenerator.dart';
import '../utils/T2Images.dart';
import '../utils/T2Slider.dart';
import '../utils/T2Strings.dart';
import '../utils/T2Widgets.dart';

class T2WalkThrough extends StatefulWidget {
  static var tag = "/walk_through2";

  final bool isDirect;

  T2WalkThrough({this.isDirect = false});

  @override
  T2WalkThroughState createState() => T2WalkThroughState();
}

class T2WalkThroughState extends State<T2WalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;

  var titles = [
    "All important tips",
    "Meditation is usefull for health",
    "Jogging is good for health"
  ];

  var subTitles = [
    Mohit_UI_KitShortText,
    Mohit_UI_KitShortText,
    Mohit_UI_KitShortText
  ];

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);

    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          children: <Widget>[
            Container(
              width: context.width(),
              height: context.height(),
              child: PageView(
                children: <Widget>[
                  WalkThrough(textContent: walk1),
                  WalkThrough(textContent: walk1),
                  WalkThrough(textContent: walk1),
                ],
                onPageChanged: (value) {
                  setState(() => currentIndexPage = value);
                },
              ),
            ),
            Positioned(
              width: context.width(),
              height: 50,
              top: context.height() * 0.58,
              child: Align(
                alignment: Alignment.center,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndexPage,
                  decorator: DotsDecorator(
                      color: t2_view_color, activeColor: t2_colorPrimary),
                ),
              ),
            ),
            Positioned(
              width: context.width(),
              top: context.height() * 0.6,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(titles[currentIndexPage],
                        style:
                            boldTextStyle(size: 20, color: textPrimaryColor)),
                    SizedBox(height: 10),
                    Center(
                        child: Text(subTitles[currentIndexPage],
                            style: primaryTextStyle(
                                size: 18, color: t2_textColorSecondary),
                            textAlign: TextAlign.center)),
                    //SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: t2AppButton(
                  textContent: t2_lbl_get_started,
                  onPressed: () {
                    changeStatusColor(t2White);
                  },
                ),
              ),
            ),
            SafeArea(
              child: Container(
                width: context.width(),
                height: 60,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: iconColorPrimaryDark,
                      ),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Center(
                        child: Text(
                          t2_lbl_walkthrough,
                          maxLines: 2,
                          style:
                              boldTextStyle(size: 22, color: textPrimaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;

  WalkThrough({Key? key, required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height(),
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            commonCachedNetworkImage(t2_walk_bg,
                fit: BoxFit.fill,
                width: context.width(),
                height: (context.height()) / 1.7),
            SafeArea(
              child: Container(
                width: context.width(),
                height: (context.height()) / 1.7,
                alignment: Alignment.center,
                child: commonCachedNetworkImage(
                  textContent,
                  width: 300,
                  height: (context.height()) / 2.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
