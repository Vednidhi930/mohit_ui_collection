import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../const/colors.dart';
import '../../../../main/AppConstant.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../../../main/utils/percent_indicator/circular_percent_indicator.dart';
import '../model/T8Models.dart';
import '../utils/T8Colors.dart';
import '../utils/T8DataGenerator.dart';
import '../utils/T8Images.dart';
import '../utils/T8Strings.dart';
import '../utils/T8Widget.dart';

class T8Search extends StatefulWidget {
  static String tag = '/T8Search';

  @override
  T8SearchState createState() => T8SearchState();
}

class T8SearchState extends State<T8Search> {
  List<T8QuizModel>? mListings;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            t8TopBar(""),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                style: TextStyle(
                    fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                cursorColor: textColorPrimary,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  hintText: t8_lbl_search,
                  filled: true,
                  fillColor: t8_white,
                  hintStyle: TextStyle(color: t8_view_color),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: t8_app_background, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: t8_app_background, width: 0.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
