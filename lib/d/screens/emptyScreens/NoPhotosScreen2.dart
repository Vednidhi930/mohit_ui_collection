import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/const/consts.dart';

class NoPhotosScreen2 extends StatefulWidget {
  const NoPhotosScreen2({Key? key}) : super(key: key);

  @override
  _NoPhotosScreen2State createState() => _NoPhotosScreen2State();
}

class _NoPhotosScreen2State extends State<NoPhotosScreen2> {
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
                '${GlobalUrl}images/emptyScreen1/noPhotos2.png'),
            70.height,
            Text('No Photos', style: boldTextStyle(size: 20)),
            16.height,
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
