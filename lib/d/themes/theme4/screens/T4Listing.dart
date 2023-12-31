import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../const/colors.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../theme1/utils/T1Widget.dart';
import '../models/T4Models.dart';
import '../utils/T4Colors.dart';
import '../utils/T4DataGenerator.dart';
import '../utils/T4Images.dart';
import '../utils/T4Constant.dart';
import '../utils/T4Strings.dart';
import '../utils/widgets/T4BottomNavigationBar.dart';
import '../utils/widgets/T4Button.dart';

class T4Listing extends StatefulWidget {
  static var tag = "/T4Listing";

  @override
  T4ListingState createState() => T4ListingState();
}

class T4ListingState extends State<T4Listing> {
  int selectedPos = 1;
  late List<T4NewsModel> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getList1Data();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Container(
        child: Column(
          children: <Widget>[
            TopBar(t4_lbl_listing),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mListings.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  child: commonCachedNetworkImage(
                                    mListings[index].image,
                                    width: width / 3,
                                    height: width / 3.2,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            text(mListings[index].name,
                                                textColor:
                                                    appStore.textPrimaryColor,
                                                fontSize: textSizeLargeMedium,
                                                fontFamily: fontBold),
                                            text(mListings[index].info,
                                                fontSize: textSizeMedium,
                                                textColor:
                                                    appStore.textPrimaryColor),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            text(mListings[index].otherinfo,
                                                fontSize: textSizeSMedium,
                                                maxLine: 3),
                                            SizedBox(
                                              height: 4,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Divider()
                          ],
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
