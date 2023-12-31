import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../theme2/utils/T2BubbleBotoomBar.dart';
import '../model/T5Models.dart';
import '../utils/T5Colors.dart';
import '../utils/T5DataGenerator.dart';
import '../utils/T5Images.dart';
import '../utils/T5Strings.dart';
import '../utils/T5Widget.dart';
import '../utils/T5Constant.dart';
import '../utils/widgets/T5BottomBar.dart';
import '../utils/widgets/T5GridListing.dart';
import '../utils/widgets/T5Slider.dart';

class T5Listing extends StatefulWidget {
  static var tag = "/listing_five";

  final bool isDirect;

  T5Listing({this.isDirect = false});

  @override
  T5ListingState createState() => T5ListingState();
}

class T5ListingState extends State<T5Listing> {
  int selectedPos = 1;
  late List<T5Bill> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getListData();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(isDirect: widget.isDirect),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20),
              child: text(t5_history,
                  textColor: appStore.textPrimaryColor,
                  fontFamily: fontBold,
                  fontSize: textSizeXLarge),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 18, bottom: 18),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    text("Oct", fontSize: textSizeSMedium),
                                    text(mListings[index].day,
                                        fontSize: textSizeLargeMedium,
                                        textColor: appStore.textSecondaryColor),
                                  ],
                                ),
                                Container(
                                  decoration: boxDecoration(
                                      radius: 8, showShadow: true),
                                  margin: EdgeInsets.only(left: 16, right: 16),
                                  width: width / 7.2,
                                  height: width / 7.2,
                                  child:
                                      SvgPicture.network(mListings[index].icon),
                                  padding: EdgeInsets.all(width / 30),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          text(mListings[index].name,
                                              textColor:
                                                  appStore.textPrimaryColor,
                                              fontSize: textSizeMedium,
                                              fontFamily: fontSemibold),
                                          text(mListings[index].amount,
                                              textColor:
                                                  appStore.textSecondaryColor,
                                              fontSize: textSizeMedium,
                                              fontFamily: fontSemibold)
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      ),
                                      text("Mastercard",
                                          fontSize: textSizeMedium)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(height: 0.5, color: t5ViewColor)
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
