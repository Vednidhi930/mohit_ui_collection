import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../const/consts.dart';
import '../ModelClass/LessonsModelClass.dart';
import '../ModelClass/LiveVideoModel.dart';
import '../ModelClass/SDChatsModel.dart';
import '../ModelClass/SDExamCardModel.dart';
import '../ModelClass/SDExamModel.dart';
import '../ModelClass/SDLessonDetailModel.dart';
import '../SDUtils/SDColors.dart';

import '../SDUtils/SDStyle.dart';
import 'SDAllLessonsScreen.dart';
import 'SDCongratulationsScreen.dart';
import 'SDExamScreen.dart';
import 'SDLessonsChapterDetailsScreen.dart';
import 'SDNotificationScreen.dart';
import 'SDSearchScreen.dart';
import 'SDWalkThroughScreen.dart';
import 'SdViewAllLivevideoScreen.dart';

class SDSplashScreen extends StatefulWidget {
  static String tag = '/smart_deck';

  @override
  _SDSplashScreenState createState() => _SDSplashScreenState();
}

class _SDSplashScreenState extends State<SDSplashScreen>
    with SingleTickerProviderStateMixin {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    // changeStatusColor(sdPrimaryColor);
    startTime();
  }

  void navigationPage() {
    finish(context);
    SDWalkThroughScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(appStore.isDarkModeOn ? black : white);
  }

  Widget build(BuildContext context) {
    changeStatusColor(sdPrimaryColor);
    return SafeArea(
      child: Scaffold(
        backgroundColor: sdPrimaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              commonCachedNetworkImage(
                  '${GlobalUrl}images/smartDeck/images/sdlogo.png',
                  height: 105),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text("Smartdeck",
                    style: secondaryTextStyle(size: 25, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
