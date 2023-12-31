import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/const/consts.dart';

class NoNotificationScreen2 extends StatefulWidget {
  const NoNotificationScreen2({Key? key}) : super(key: key);

  @override
  _NoNotificationScreen2State createState() => _NoNotificationScreen2State();
}

class _NoNotificationScreen2State extends State<NoNotificationScreen2> {
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
            Container(
              padding: EdgeInsets.all(32),
              height: 230,
              decoration: BoxDecoration(
                  color: lightGray.withOpacity(0.3), shape: BoxShape.circle),
              child: commonCachedNetworkImage(
                  '${GlobalUrl}images/emptyScreen1/checkList.png'),
            ),
            70.height,
            Text('No Notification', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              Mohit_UI_KitShortText,
              style: secondaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
          ],
        ),
      ),
    );
  }
}
