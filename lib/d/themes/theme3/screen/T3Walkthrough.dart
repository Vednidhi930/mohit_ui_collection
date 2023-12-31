import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mohit_ui_collection/d/themes/theme12/utils/t12_images.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/main/AppStore.dart';

import '../../../../const/consts.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/utils/dots_indicator/src/dots_decorator.dart';
import '../../../../main/utils/dots_indicator/src/dots_indicator.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';
import 'T3Dashboard.dart';
import 'T3Listing.dart';

class T3WalkThrough extends StatefulWidget {
  static var tag = "/T3WalkThrough";

  @override
  T3WalkThroughState createState() => T3WalkThroughState();
}

class T3WalkThroughState extends State<T3WalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;
  var titles = [
    "Sign in / Sign Up",
    "Choose Your Favourite Chef",
    "Make Delicious Dishes"
  ];
  var subTitles = [
    Mohit_UI_KitShortText,
    Mohit_UI_KitShortText,
    Mohit_UI_KitShortText
  ];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Container(
            child: Positioned(
              width: context.width(),
              top: context.height() * 0.43,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: DotsIndicator(
                        dotsCount: 3,
                        position: currentIndexPage,
                        decorator: DotsDecorator(
                          color: t3_view_color,
                          activeColor: t3_colorPrimary,
                        )),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(titles[currentIndexPage],
                            style: boldTextStyle(
                                size: 20, color: t3_colorPrimary)),
                        SizedBox(height: 16),
                        Center(
                            child: Text(
                          subTitles[currentIndexPage],
                          style: secondaryTextStyle(size: 18),
                          textAlign: TextAlign.center,
                        )),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          textStyle: TextStyle(color: t3_white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(80.0),
                                  topLeft: Radius.circular(80.0))),
                          padding: EdgeInsets.all(0.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              t3_colorPrimary,
                              t3_colorPrimaryDark
                            ]),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(80.0),
                                topLeft: Radius.circular(80.0)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("Skip",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
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
      alignment: Alignment.topCenter,
      child: commonCachedNetworkImage(textContent,
          width: 280, height: (context.height()) / 2.3, color: t3_colorPrimary),
    );
  }
}
