import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohit_ui_collection/d/themes/theme12/utils/t12_images.dart';
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

class T4Detail extends StatefulWidget {
  static var tag = "/T4Description";

  @override
  T4DetailState createState() => T4DetailState();
}

class T4DetailState extends State<T4Detail> {
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
    var height = context.height();

    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: appBar(context, t4_lbl_single_article),
      body: Observer(
        builder: (_) => Container(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  16.height,
                  Row(
                    children: <Widget>[
                      SizedBox(width: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: commonCachedNetworkImage(
                          t4_bg,
                          width: (width - 48) * 0.5,
                          height: height * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: commonCachedNetworkImage(
                          t4_bg,
                          width: (width - 48) * 0.5,
                          height: height * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: text(t4_samplelong_text,
                        textColor: appStore.textPrimaryColor,
                        fontSize: textSizeMedium,
                        maxLine: 10),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Divider(height: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 12, bottom: 12, left: 16, right: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage(t12_profile),
                                radius: 28,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    text(t4_username,
                                        textColor: appStore.textPrimaryColor,
                                        fontSize: textSizeMedium,
                                        fontFamily: fontMedium),
                                    text(t4_designation,
                                        fontSize: textSizeMedium)
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              )
                            ],
                          ),
                        ),
                        T4Button(
                          textContent: t4_lbl_follow,
                          isStroked: true,
                          height: 40,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
                    child: text("Related Articles",
                        textColor: appStore.textPrimaryColor,
                        fontFamily: fontBold,
                        fontSize: textSizeNormal),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: commonCachedNetworkImage(
                                    mListings[index].image,
                                    width: width / 3,
                                    height: width / 3.2,
                                    fit: BoxFit.fill,
                                  ),
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
                                                textColor: appStore
                                                    .textSecondaryColor),
                                            SizedBox(height: 4),
                                            text(mListings[index].otherinfo,
                                                fontSize: textSizeSMedium,
                                                maxLine: 3),
                                            SizedBox(height: 4),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16),
                            Divider()
                          ],
                        ),
                      );
                    },
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
