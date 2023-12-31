import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../main/AppWidget.dart';

import '../../../const/strings.dart';

class EmptyCartScreen extends StatefulWidget {
  static var tag = "/empty_cart1";
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  _EmptyCartScreenState createState() => _EmptyCartScreenState();
}

class _EmptyCartScreenState extends State<EmptyCartScreen> {
  @override
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
              padding: EdgeInsets.all(16),
              child: commonCachedNetworkImage(
                  '${GlobalUrl}images/emptyScreen1/emptyCart1.png'),
              decoration: BoxDecoration(
                  color: grey.withOpacity(0.2), shape: BoxShape.circle),
            ),
            70.height,
            Text('Empty Cart', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              Mohit_UI_KitShortText,
              style: primaryTextStyle(size: 15, color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              backgroundColor: Color(0xFF2D3E5E),
              child: Icon(Ionicons.cart_outline, size: 30, color: Colors.white),
              onPressed: () {
                toast('Add Items');
              },
            ),
          ],
        ),
      ),
    );
  }
}
