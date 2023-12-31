import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mohit_ui_collection/d/themes/theme14/utils/T14Images.dart';
import 'package:mohit_ui_collection/library/flutter_overboard/cache_image_network.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../const/strings.dart';

import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../models/T10Models.dart';
import '../utils/T10Colors.dart';
import '../utils/T10DataGenerator.dart';
import '../utils/T10Images.dart';
import '../utils/T10Strings.dart';
import '../utils/T10Constant.dart';
import '../utils/T10Widget.dart';

class T10Profile extends StatefulWidget {
  static String tag = '/profile_ten';

  final bool isDirect;

  T10Profile({this.isDirect = false});

  @override
  T10ProfileState createState() => T10ProfileState();
}

class T10ProfileState extends State<T10Profile> {
  late List<T10Images> mList;

  @override
  void initState() {
    super.initState();
    mList = getProfile();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    var width = context.width();

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: context.width(),
              child:
                  T10TopBar(theme10_title_profile, isDirect: widget.isDirect),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: spacing_standard_new),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(spacing_middle),
                                bottomRight:
                                    Radius.circular(spacing_standard_new)),
                            child: commonCachedNetworkImage(
                              '${GlobalUrl}images/themes/theme14/t14_profile1.jpeg',
                              fit: BoxFit.cover,
                              height: width * 0.35,
                            ),
                          ),
                        ),
                        SizedBox(width: spacing_standard_new),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(theme10_user_name,
                                  textColor: appStore.textPrimaryColor,
                                  fontFamily: fontMedium,
                                  fontSize: textSizeLargeMedium),
                              text(theme10_lbl_designer,
                                  textColor: appStore.textSecondaryColor),
                              SizedBox(height: spacing_control),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: spacing_control),
                                        child: Icon(Icons.location_on,
                                            color: appStore.iconColor,
                                            size: 18),
                                      ),
                                    ),
                                    TextSpan(
                                        text: theme10_lbl_address,
                                        style: TextStyle(
                                            fontSize: textSizeMedium,
                                            color:
                                                appStore.textSecondaryColor)),
                                  ],
                                ),
                              ),
                              SizedBox(height: spacing_standard),
                              Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      text(theme10_lbl_150,
                                          textColor: appStore.textPrimaryColor,
                                          fontFamily: fontMedium),
                                      text(theme10_lbl_design,
                                          textColor:
                                              appStore.textSecondaryColor),
                                    ],
                                  ),
                                  Container(
                                    height: width * 0.1,
                                    width: 0.5,
                                    color: t10_view_color,
                                    margin: EdgeInsets.only(
                                        left: spacing_standard_new,
                                        right: spacing_standard_new),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      text(theme10_lbl_2K,
                                          textColor: appStore.textPrimaryColor,
                                          fontFamily: fontMedium),
                                      text(theme10_lbl_followers,
                                          textColor:
                                              appStore.textSecondaryColor),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(spacing_standard_new),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(theme10_about,
                              textColor: appStore.textPrimaryColor,
                              fontFamily: fontMedium,
                              fontSize: textSizeLargeMedium),
                          Text(theme10_samplelong_text,
                              style: secondaryTextStyle()),
                          SizedBox(height: spacing_standard_new),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(theme10_photos,
                                  textColor: appStore.textPrimaryColor,
                                  fontFamily: fontMedium,
                                  fontSize: textSizeLargeMedium),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: theme10_view_all,
                                        style: TextStyle(
                                            fontSize: textSizeMedium,
                                            fontFamily: fontMedium,
                                            color:
                                                appStore.textSecondaryColor)),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 0),
                                        child: Icon(Icons.keyboard_arrow_right,
                                            color: appStore.iconColor,
                                            size: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: spacing_standard_new),
                          GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: mList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(spacing_middle)),
                                child: buildCacheNetworkImage(
                                  url: mList[index].img,
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
