import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:mohit_ui_collection/const/consts.dart';

class NoChatsScreen extends StatefulWidget {
  static var tag = "/no_chats1";
  const NoChatsScreen({Key? key}) : super(key: key);

  @override
  _NoChatsScreenState createState() => _NoChatsScreenState();
}

class _NoChatsScreenState extends State<NoChatsScreen> {
  //   @override
  // void dispose() {
  //   setStatusBarColor(context.scaffoldBackgroundColor);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF2D3E5E),
          onPressed: () {
            toast('Start Chat');
          },
          child: Icon(Icons.message, color: Colors.white),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonCachedNetworkImage(
                '${GlobalUrl}images/emptyScreen1/noChats.png',
                height: 300),
            32.height,
            Text('No Chats !', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              Mohit_UI_KitShortText,
              style: secondaryTextStyle(),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 40),
          ],
        ),
      ),
    );
  }
}
