import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/main/AppStore.dart';

import '../../../../const/consts.dart';
import '../../../../main/AppWidget.dart';
import '../model/T3_Model.dart';
import '../utils/T3BottomNavigationBar.dart';
import '../utils/T3DataGenerator.dart';
import '../utils/T3Images.dart';
import '../utils/T3widgets.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import 'T3Listing.dart';

class T3Description extends StatefulWidget {
  static String tag = '/T3Description';

  @override
  T3DescriptionState createState() => T3DescriptionState();
}

class T3DescriptionState extends State<T3Description> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);

    return Scaffold(
      body: Observer(
        builder: (_) => NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                titleSpacing: 0,
                backgroundColor: t3_colorPrimary,
                actionsIconTheme: IconThemeData(opacity: 0.0),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: !innerBoxIsScrolled ? white : Colors.black),
                    onPressed: () {
                      finish(context);
                    }),
                title: Text(t3_lbl_food_recipe_detail,
                    style: boldTextStyle(color: white, size: 22)),
                flexibleSpace: FlexibleSpaceBar(
                    background: commonCachedNetworkImage(
                  masala_dosa,
                  fit: BoxFit.cover,
                )),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(t3_text_cheese_roll_done_by_john_doe,
                          style: boldTextStyle(size: 18)),
                      SvgPicture.network(t3_ic_favourite, color: t3_red)
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(t3_lbl_share_to, style: primaryTextStyle(size: 14)),
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      SvgPicture.network(t3_ic_wp, height: 24, width: 24),
                      SizedBox(width: 10),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: commonCachedNetworkImage(t3_ic_facebook,
                              height: 24, width: 24)),
                      SizedBox(width: 10),
                      SvgPicture.network(t3_ic_instagram,
                          height: 24, width: 24),
                      SizedBox(width: 10),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: commonCachedNetworkImage(t3_ic_linkedin,
                              height: 24, width: 24)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(t3_lbl_recipe_steps, style: primaryTextStyle(size: 14)),
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(t3_lbl_desc, style: primaryTextStyle(size: 16)),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: T3AppButton(
                      textContent: t3_lbl_check_video,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
