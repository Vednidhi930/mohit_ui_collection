import 'package:flutter/material.dart';
import 'package:mohit_ui_collection/const/consts.dart';
import 'package:nb_utils/nb_utils.dart';

class EmptyCartScreen5 extends StatefulWidget {
  static var tag = "/empty_cart";
  const EmptyCartScreen5({Key? key}) : super(key: key);

  @override
  _EmptyCartScreen5State createState() => _EmptyCartScreen5State();
}

class _EmptyCartScreen5State extends State<EmptyCartScreen5> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFF58968));
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
        backgroundColor: Color(0xFFF58968),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 230,
                    decoration: BoxDecoration(
                        color: Color(0xFFF17650), shape: BoxShape.circle)),
                Positioned(
                    top: -40,
                    child: commonCachedNetworkImage(
                        '${GlobalUrl}images/emptyScreen1/emptyCart5.png',
                        height: 250)),
              ],
            ),
            80.height,
            Text('Empty Cart', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              Mohit_UI_KitShortText,
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
          ],
        ),
      ),
    );
  }
}
