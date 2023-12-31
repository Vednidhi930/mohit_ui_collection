import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mohit_ui_collection/const/consts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../theme1/utils/T1Constant.dart';
import '../../../../main/AppWidget.dart';
import '../model/T1_model.dart';
import '../utils/T1Colors.dart';
import '../utils/T1DataGenerator.dart';
import '../utils/T1Images.dart';
import '../utils/T1Strings.dart';
import '../utils/T1Widget.dart';
import 'T1Listing.dart';
import 'T1Profile.dart';

class T1Listing extends StatefulWidget {
  static var tag = "/T1Listing";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return T1ListingState();
  }
}

class T1ListingState extends State<T1Listing> {
  late List<T1Model> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getListings();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appBarBackgroundColor);
    return Scaffold(
      appBar: appBar(context, t1_Listing),
      body: Observer(
        builder: (_) => Container(
          child: Column(
            children: <Widget>[
              16.height,
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mListings.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return T1ListItem(mListings[index], index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class T1ListItem extends StatelessWidget {
  late T1Model model;
  late int pos;

  T1ListItem(T1Model model, int pos) {
    this.model = model;
    this.pos = pos;
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Container(
        decoration: boxDecoration(
            bgColor: context.scaffoldBackgroundColor,
            radius: 10,
            showShadow: true),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        child: commonCachedNetworkImage(
                          model.img,
                          width: width / 5.5,
                          height: width / 6,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text(model.name,
                                      textColor: textPrimaryColor,
                                      fontFamily: fontBold,
                                      fontSize: textSizeNormal,
                                      maxLine: 2),
                                  text(model.duration,
                                      textColor: textSecondaryColor,
                                      fontSize: textSizeMedium),
                                ],
                              ),
                              text(model.designation,
                                  fontSize: textSizeLargeMedium,
                                  textColor: textPrimaryColor,
                                  fontFamily: fontMedium),
                            ],
                          ),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  SizedBox(height: 16),
                  text(t1_samplelong_text,
                      fontSize: textSizeMedium,
                      maxLine: 2,
                      textColor: textPrimaryColor),
                ],
              ),
            ),
            Container(
              width: 4,
              height: 35,
              margin: EdgeInsets.only(top: 16),
              color: pos % 2 == 0 ? t1TextColorPrimary : t1_colorPrimary,
            )
          ],
        ),
      ),
    );
  }
}
