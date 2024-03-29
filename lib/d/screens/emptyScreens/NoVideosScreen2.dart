import 'package:mohit_ui_collection/const/consts.dart';
import 'package:flutter/material.dart';
import 'package:mohit_ui_collection/d/screens/emptyScreens/utils/SemiCircleClipper.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../const/strings.dart';

class NoVideosScreen2 extends StatefulWidget {
  const NoVideosScreen2({Key? key}) : super(key: key);

  @override
  _NoVideosScreen2State createState() => _NoVideosScreen2State();
}

class _NoVideosScreen2State extends State<NoVideosScreen2> {
  //   @override
  // void dispose() {
  //   setStatusBarColor(context.scaffoldBackgroundColor);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            48.height,
            Text('No Videos!', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              Mohit_UI_KitShortText,
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            48.height,
            Container(
              height: 400,
              padding: EdgeInsets.all(80),
              decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8), shape: BoxShape.circle),
              child: commonCachedNetworkImage(
                  '${GlobalUrl}images/emptyScreen1/noVideo1.png'),
            ),
          ],
        ),
      ),
    );
  }
}
