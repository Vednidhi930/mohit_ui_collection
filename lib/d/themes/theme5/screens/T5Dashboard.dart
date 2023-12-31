import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mohit_ui_collection/d/themes/theme12/utils/t12_images.dart';
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

class T5Dashboard extends StatefulWidget {
  static var tag = "/T5Dashboard";

  @override
  T5DashboardState createState() => T5DashboardState();
}

class T5DashboardState extends State<T5Dashboard> {
  bool passwordVisible = false;
  bool isRemember = false;
  var currentIndexPage = 0;
  List<T5Category>? mFavouriteList;
  List<T5Slider>? mSliderList;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
    mFavouriteList = getCategoryItems();
    mSliderList = getSliders();
  }

  void changeSldier(int index) {
    setState(() {
      currentIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t5DarkNavy);
    var width = context.width();
    width = width - 50;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: t5DarkNavy,
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 70,
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(t12_profile),
                        radius: 25,
                      ),
                      SizedBox(width: 16),
                      text(t5_username,
                          textColor: t5White,
                          fontSize: textSizeNormal,
                          fontFamily: fontMedium)
                    ],
                  ),
                  SvgPicture.network(t5_options,
                      width: 25, height: 25, color: t5White)
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                padding: EdgeInsets.only(top: 28),
                alignment: Alignment.topLeft,
                height: context.height() - 100,
                decoration: BoxDecoration(
                    color: context.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    T5SliderWidget(mSliderList),
                    SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: T5GridListing(mFavouriteList, false),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: T5BottomBar(),
    );
  }
}
