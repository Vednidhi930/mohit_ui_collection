import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../const/strings.dart';
import '../../../main/AppWidget.dart';

class DeadEndScreen extends StatefulWidget {
  const DeadEndScreen({Key? key}) : super(key: key);

  static var tag = "/dead_end";

  @override
  _DeadEndScreenState createState() => _DeadEndScreenState();
}

class _DeadEndScreenState extends State<DeadEndScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF3BC3A4));
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
              '${GlobalUrl}images/errorScreens/8_404_Error.png',
              fit: BoxFit.fill,
              height: context.height(),
              width: context.width(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Dead End',
                    style: primaryTextStyle(size: 40, color: white)),
                32.height,
                Text(
                  'Opps! The page you are looking for doesn\'t exist...',
                  style: primaryTextStyle(color: Colors.white60, size: 18),
                ),
                48.height,
                AppButton(
                  child: Text('HOME', style: boldTextStyle()),
                  color: context.cardColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 10,
                  onTap: () {
                    toast('HOME');
                  },
                ),
              ],
            ).paddingAll(32),
          ],
        ),
      ),
    );
  }
}
