import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mohit_ui_collection/library/flutter_overboard/cache_image_network.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../const/colors.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../model/T11Model.dart';
import '../utils/T11DataGenerator.dart';
import '../utils/T11Images.dart';
import '../utils/T11Strings.dart';
import '../utils/T11Widget.dart';

class T11Card2Screen extends StatefulWidget {
  @override
  T11Card2ScreenState createState() => T11Card2ScreenState();
}

class T11Card2ScreenState extends State<T11Card2Screen> {
  @override
  void initState() {
    setStatusBarColor(appStore.appBarColor!, statusBarIconBrightness: Brightness.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            buildCacheNetworkImage(
             url: t11_ic_bottom_sheet,
               height :context.height(),
              width: context.width(),
            ).cornerRadiusWithClipRRect(32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text(t11_lbl_new_release, style: boldTextStyle(size: 18, color: white)),
                Text(t11_lbl_album_name1, style: boldTextStyle(size: 28, color: white)),
                Text('by ' + t11_lbl_singer_name1, style: boldTextStyle(color: white)),
              ],
            ).paddingAll(16)
          ],
        ).paddingAll(16),
        bottomNavigationBar: T11PlayPauseAnimation(),
      ),
    );
  }
}
