import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/const/consts.dart';

import '../../../const/strings.dart';

class NoPhotosScreen extends StatefulWidget {
  const NoPhotosScreen({Key? key}) : super(key: key);

  @override
  _NoPhotosScreenState createState() => _NoPhotosScreenState();
}

class _NoPhotosScreenState extends State<NoPhotosScreen> {
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            commonCachedNetworkImage(
                '${GlobalUrl}images/emptyScreen1/noPhotos1.png'),
            32.height,
            Text('No Photos!', style: boldTextStyle(size: 20)),
            32.height,
            Text(
              Mohit_UI_KitShortText,
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              child: Icon(Icons.add, size: 30),
              onPressed: () {
                toast('Add Photos');
              },
            ),
          ],
        ),
      ),
    );
  }
}
