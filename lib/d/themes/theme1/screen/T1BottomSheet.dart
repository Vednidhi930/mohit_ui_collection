import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mohit_ui_collection/const/colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../../theme1/utils/T1Widget.dart';
import '../utils/T1Colors.dart';
import '../utils/T1Images.dart';
import '../utils/T1Strings.dart';

class T1BottomSheet extends StatefulWidget {
  static var tag = "/T1BottomSheet";

  @override
  T1BottomSheetState createState() => T1BottomSheetState();
}

class T1BottomSheetState extends State<T1BottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  Future showBottomSheet() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 22),
              child: Container(
                width: context.width(),
                height: 150,
                child: Stack(
                  children: <Widget>[
                    commonCachedNetworkImage(t1_ic_bottom_sheet,
                        width: context.width(), height: 150, fit: BoxFit.fill),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 40),
                        text(t1_lbl_share_to, textColor: Colors.black),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(width: 10),
                            Icon(Icons.keyboard_arrow_left, size: 24),
                            Container(
                              width: context.width() - 100,
                              height: 50,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    shareIcon(t1_whatsup),
                                    shareIcon(t1_facebook),
                                    shareIcon(t1_instagram),
                                    shareIcon(t1_linkedin),
                                    shareIcon(t1_whatsup),
                                  ],
                                ),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_right, size: 24),
                            SizedBox(width: 10),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Container(
                width: 45,
                height: 45,
                child: FloatingActionButton(
                  onPressed: () {
                    finish(context);
                  },
                  child: Icon(Icons.share, color: t1_colorPrimary),
                  backgroundColor: t1_white,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appBarBackgroundColor);

    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        showBottomSheet();
      },
    );

    return Scaffold(
      appBar: appBar(context, t1_Bottom_Sheet),
      body: Observer(
        builder: (_) => InkWell(
            child: ring(t1_lbl_welcome_to_bottom_n_sheet),
            onTap: () => showBottomSheet()).center(),
      ),
    );
  }
}
