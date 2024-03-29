import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../const/strings.dart';
import '../../../main/AppWidget.dart';

class EmptyCartScreen3 extends StatefulWidget {
  const EmptyCartScreen3({Key? key}) : super(key: key);

  @override
  _EmptyCartScreen3State createState() => _EmptyCartScreen3State();
}

class _EmptyCartScreen3State extends State<EmptyCartScreen3> {
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
              decoration: BoxDecoration(
                  color: grey.withOpacity(0.2), shape: BoxShape.circle),
              child: commonCachedNetworkImage(
                  '${GlobalUrl}images/emptyScreen1/emptyCart5.png'),
            ),
            70.height,
            Text('Empty Cart', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              Mohit_UI_KitShortText,
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            50.height,
            AppButton(
              child: Text('Start Shop', style: boldTextStyle(color: white))
                  .paddingSymmetric(horizontal: 32),
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
              color: Color(0xFF2D3E5E),
              onTap: () {
                toast('Start Shop');
              },
            ),
          ],
        ),
      ),
    );
  }
}
