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
import 'T3Dashboard.dart';
import 'T3Listing.dart';

class T3Listing extends StatefulWidget {
  static var tag = "/T3Listing";

  @override
  T3ListingState createState() => T3ListingState();
}

class T3ListingState extends State<T3Listing> {
  late List<Theme3Dish> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getList();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Container(
        color: context.scaffoldBackgroundColor,
        child: Stack(
          children: <Widget>[
            Container(
              height: (context.height()) / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
              ),
            ),
            Column(
              children: <Widget>[
                T3AppBar(t3_lbl_listing),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mListings.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return T3List(mListings[index], index);
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class T3List extends StatelessWidget {
  late Theme3Dish model;

  T3List(Theme3Dish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: defaultBoxShadow(),
          color: context.scaffoldBackgroundColor),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      child: commonCachedNetworkImage(
                        model.dishImage,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            model.dishName,
                            style: boldTextStyle(size: 18),
                            maxLines: 2,
                          ).expand(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(t3_lbl_share_to, style: boldTextStyle(size: 14)),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        SvgPicture.network(t3_ic_wp, height: 20, width: 20),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: commonCachedNetworkImage(t3_ic_facebook,
                                height: 20, width: 20)),
                        SvgPicture.network(t3_ic_instagram,
                            height: 20, width: 20),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: commonCachedNetworkImage(t3_ic_linkedin,
                                height: 20, width: 20)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(model.description,
                        style: secondaryTextStyle(size: 16), maxLines: 2),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: t3_white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  padding: EdgeInsets.all(0.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        t3_lbl_view_more_recipe,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
