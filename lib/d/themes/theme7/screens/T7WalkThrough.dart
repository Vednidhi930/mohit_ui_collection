import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohit_ui_collection/d/themes/theme14/utils/T14Images.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppConstant.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../models/T7Models.dart';
import '../utils/T7BottomNavigationBar.dart';
import '../utils/T7Colors.dart';
import '../utils/T7DataGenerator.dart';
import '../utils/T7Images.dart';
import '../utils/T7Strings.dart';
import '../utils/T7Widget.dart';

class T7WalkThrough extends StatefulWidget {
  static String tag = '/T7WalkThrough';

  @override
  T7WalkThroughState createState() => T7WalkThroughState();
}

class T7WalkThroughState extends State<T7WalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;
  var titles = [
    "Discover New Destination",
    "Best Flight Booking Service",
  ];
  var subTitles = [
    "Where to go in 2020? Discover new place around you!. Top travel destinations with Trip.go in 2020",
    "Where to go in 2020? Discover new destinations around you!. Top travel destinations with Trip.go in 2020",
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
      body: Container(
        child: PageView(
          children: <Widget>[
            WalkThrough(
              textContent: t14_travel1,
              title: titles[currentIndexPage],
              info: subTitles[currentIndexPage],
            ),
            WalkThrough(
              textContent: t14_travel2,
              title: titles[currentIndexPage],
              info: subTitles[currentIndexPage],
            ),
          ],
          onPageChanged: (value) {
            setState(() => currentIndexPage = value);
          },
        ),
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;
  final String title;
  final String info;

  WalkThrough(
      {Key? key,
      required this.textContent,
      required this.title,
      required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        commonCacheImageWidget(
          textContent,
          fit: BoxFit.fill,
          width: context.width(),
          context.height(),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
              margin: EdgeInsets.only(top: 80),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: text(t7_trip_go,
                    textColor: t7white, fontSize: textSizeXLarge),
              ),
              decoration: boxDecoration(radius: 12, bgColor: t7_black_trans)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: t7_black_trans),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  text(title, textColor: t7white, fontFamily: fontSemibold),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: text(info,
                          textColor: t7textColorSecondary, isLongText: true)),
                  SizedBox(
                    height: 20,
                  ),
                  T7Button(
                    textContent: t7_get_started,
                    onPressed: () {},
                    bgColor: t7white,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  text(t7_skip_for_now, textColor: t7white)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
