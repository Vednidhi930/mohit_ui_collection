import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../const/strings.dart';
import '../../../main/AppWidget.dart';

class HangOnScreen extends StatefulWidget {
  static var tag = "/hang_on";

  @override
  _HangOnScreenState createState() => _HangOnScreenState();
}

class _HangOnScreenState extends State<HangOnScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF44556E));
    super.initState();
  }

  //   @override
  // void dispose() {
  //   setStatusBarColor(context.scaffoldBackgroundColor);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            commonCachedNetworkImage(
              '${GlobalUrl}images/errorScreens/17_Location_Error.png',
              fit: BoxFit.fill,
              height: context.height(),
              width: context.width(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Hang on a sec..',
                    style: secondaryTextStyle(size: 40, color: white)),
                48.height,
                Text('It seems you are in the middle of the ocean.',
                    style: primaryTextStyle(size: 20, color: Colors.white54)),
                48.height,
                AppButton(
                  color: context.cardColor,
                  child: Text('REFRESH', style: boldTextStyle())
                      .paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  onTap: () {
                    toast('REFRESH');
                  },
                ),
                48.height,
              ],
            ).paddingAll(32),
          ],
        ),
      ),
    );
  }
}
