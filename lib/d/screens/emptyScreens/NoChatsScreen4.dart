import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/const/consts.dart';

class NoChatsScreen4 extends StatefulWidget {
  const NoChatsScreen4({Key? key}) : super(key: key);

  @override
  _NoChatsScreen4State createState() => _NoChatsScreen4State();
}

class _NoChatsScreen4State extends State<NoChatsScreen4> {
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
                '${GlobalUrl}images/emptyScreen1/noChats4.png',
                height: 250),
            48.height,
            Text('No Chats!', style: boldTextStyle(size: 20)),
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
