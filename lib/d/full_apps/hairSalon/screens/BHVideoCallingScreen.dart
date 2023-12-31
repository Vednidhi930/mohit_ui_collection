import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../const/consts.dart';
import '../utils/BHImages.dart';
import '../utils/BHDataProvider.dart';
import '../utils/BHConstants.dart';
import '../utils/BHWidgets.dart';
import '../model/BHModel.dart';

class BHVideoCallingScreen extends StatefulWidget {
  static String tag = '/VideoCallingScreen';

  @override
  BHVideoCallingScreenState createState() => BHVideoCallingScreenState();
}

class BHVideoCallingScreenState extends State<BHVideoCallingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        title: Text('Carlos Day', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.camera_alt, color: Colors.white)),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          commonCacheImageWidget(
            BHCallingBackgroundImg,
            MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: commonCacheImageWidget(BHdDashedBoardImage5, 180,
                  width: 130, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
