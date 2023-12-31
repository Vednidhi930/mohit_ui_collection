import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../models/T10Models.dart';
import '../utils/T10Colors.dart';
import '../utils/T10DataGenerator.dart';
import '../utils/T10Images.dart';
import '../utils/T10Strings.dart';
import '../utils/T10Constant.dart';
import '../utils/T10Widget.dart';

class T10Listing extends StatefulWidget {
  static String tag = '/T10Listing';

  @override
  T10ListingState createState() => T10ListingState();
}

class T10ListingState extends State<T10Listing> {
  late List<T10Product> mList;

  @override
  void initState() {
    super.initState();
    mList = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            T10TopBar(theme10_title_products),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductList(mList[index], index);
                }),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductList extends StatelessWidget {
  late T10Product model;

  ProductList(T10Product model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    return Container(
        margin: EdgeInsets.only(
            left: spacing_standard_new,
            right: spacing_standard_new,
            bottom: spacing_standard_new),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(spacing_middle)),
                    child: commonCacheImageWidget(
                      model.img,
                      fit: BoxFit.cover,
                      width * 0.2,
                    ),
                  ),
                ),
                SizedBox(
                  width: spacing_standard_new,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          text(model.name,
                              textColor: appStore.textPrimaryColor,
                              fontFamily: fontMedium),
                        ],
                      ),
                      text(model.category,
                          textColor: appStore.textSecondaryColor),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              text(model.price,
                                  textColor: appStore.textSecondaryColor),
                              SizedBox(width: spacing_control),
                              text(model.subPrice,
                                  textColor: appStore.textSecondaryColor,
                                  lineThrough: true),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.remove_circle,
                                  color: t10_textColorSecondary, size: 20),
                              SizedBox(width: 4),
                              text("2",
                                  textColor: appStore.textSecondaryColor,
                                  fontFamily: fontMedium,
                                  fontSize: textSizeLargeMedium),
                              SizedBox(width: 4),
                              Icon(Icons.add_circle,
                                  color: t10_textColorSecondary, size: 20)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: spacing_standard_new),
            Divider(color: t10_view_color, height: 0.5)
          ],
        ));
  }
}
