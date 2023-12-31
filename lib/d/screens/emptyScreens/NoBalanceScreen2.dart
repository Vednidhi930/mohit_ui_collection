import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../const/strings.dart';
import '../../../main/AppWidget.dart';

class NoBalanceScreen2 extends StatefulWidget {
  static var tag = "/no_balance2";
  const NoBalanceScreen2({Key? key}) : super(key: key);

  @override
  _NoBalanceScreen2State createState() => _NoBalanceScreen2State();
}

class _NoBalanceScreen2State extends State<NoBalanceScreen2> {
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
              height: 230,
              child: commonCachedNetworkImage(
                  '${GlobalUrl}images/emptyScreen1/noBalance4.png'),
              decoration: BoxDecoration(
                  color: grey.withOpacity(0.2), shape: BoxShape.circle),
            ),
            70.height,
            Text('No Balance!', style: boldTextStyle(size: 20)),
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
