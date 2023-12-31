import 'package:flutter/material.dart';
import 'package:mohit_ui_collection/main/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../const/strings.dart';

class ConnectionFailedScreen extends StatefulWidget {
  const ConnectionFailedScreen({Key? key}) : super(key: key);

  static var tag = "/connection_failed";

  @override
  _ConnectionFailedScreenState createState() => _ConnectionFailedScreenState();
}

class _ConnectionFailedScreenState extends State<ConnectionFailedScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFDEE0E8));
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
                '${GlobalUrl}images/errorScreens/19_Error.png',
                height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Connection Failed',
                    style: boldTextStyle(size: 30, color: Colors.black54)),
                16.height,
                Text(
                  'Could not connect to the network, Please check & retry again.',
                  style: primaryTextStyle(size: 18, color: Colors.black45),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('RETRY', style: boldTextStyle(color: white))
                      .paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  color: Color(0xFF5ECB42),
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    toast('RETRY');
                  },
                ),
                100.height,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
