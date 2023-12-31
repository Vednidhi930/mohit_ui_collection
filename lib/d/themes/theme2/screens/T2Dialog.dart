import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../const/colors.dart';
import '../../../../main/AppWidget.dart';
import '../models/models.dart';
import '../utils/T2BubbleBotoomBar.dart';
import '../utils/T2Colors.dart';
import '../utils/T2DataGenerator.dart';
import '../utils/T2Images.dart';
import '../utils/T2Slider.dart';
import '../utils/T2Strings.dart';
import '../utils/T2Widgets.dart';
import 'T2Profile.dart';

class T2Dialog extends StatefulWidget {
  static var tag = "/T2Dialog";

  @override
  T2DialogState createState() => T2DialogState();
}

class T2DialogState extends State<T2Dialog> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appBarBackgroundColor);

    Future.delayed(Duration(milliseconds: 1000), () {
      showDialog(
          context: context, builder: (BuildContext context) => CustomDialog());
    });
    return Observer(builder: (_) => T2Profile());
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: context.scaffoldBackgroundColor,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.black26, blurRadius: 10.0, offset: Offset(0.0, 10.0)),
      ],
    ),
    width: context.width(),
    child: Column(
      mainAxisSize: MainAxisSize.min, // To make the card compact
      children: <Widget>[
        GestureDetector(
          onTap: () {
            finish(context);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Icon(Icons.close, color: iconColorPrimaryDark),
          ),
        ),
        commonCachedNetworkImage(t2_ic_dialog,
            color: t2_colorPrimary, width: 95, height: 95),
        SizedBox(height: 24),
        Text("Congratulations!",
            style: boldTextStyle(color: t2_colorPrimary, size: 24)),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Text(t2_sample_text,
                  style: primaryTextStyle(size: 16),
                  textAlign: TextAlign.center)
              .center(),
        ),
        SizedBox(height: 30),
        Container(
          width: context.width(),
          height: 50,
          decoration: BoxDecoration(
            color: t2_colorPrimary,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
          alignment: Alignment.center,
          child: Text(t2_lbl_try_again,
              style: boldTextStyle(color: white, size: 20)),
        )
      ],
    ),
  );
}
