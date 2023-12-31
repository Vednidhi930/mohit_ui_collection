import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppConstant.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../../../main/utils/flutter_rating_bar.dart';
import '../model/LearnerModels.dart';
import '../utils/LearnerColors.dart';
import '../utils/LearnerDataGenerator.dart';
import '../utils/LearnerImages.dart';
import '../utils/LearnerStrings.dart';
import 'learnerFriendDetail.dart';

class LearnerMyFriends extends StatefulWidget {
  @override
  _LearnerMyFriendsState createState() => _LearnerMyFriendsState();
}

class _LearnerMyFriendsState extends State<LearnerMyFriends> {
  late List<LearnerPeopleModel> mList1;
  late List<LearnerPeopleModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetPending();
    mList2 = learnerGetPending();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(175),
              child: SafeArea(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 8),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: context.width(),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: learner_colorPrimary),
                          onPressed: () {
                            finish(context);
                          },
                        ),
                      ),
                      text(learner_lbl_My_Friends,
                          fontSize: textSizeLarge,
                          fontFamily: fontBold,
                          textColor: learner_textColorPrimary),
                      8.height,
                      Container(
                        width: context.width() / 1.3,
                        child: TabBar(
                          labelPadding: EdgeInsets.only(left: 0, right: 0),
                          indicatorWeight: 4.0,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: learner_colorPrimary,
                          labelColor: learner_colorPrimary,
                          isScrollable: true,
                          unselectedLabelColor: learner_textColorSecondary,
                          tabs: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                learner_lbl_Accepted,
                                style: TextStyle(
                                    fontSize: 18.0, fontFamily: fontBold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                children: <Widget>[
                                  Text(learner_lbl_pending,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: fontBold)),
                                  Container(
                                    color: learner_colorPrimary,
                                    height: 25,
                                    width: 40,
                                    child: text("80+",
                                            textColor: learner_white,
                                            fontSize: textSizeSMedium)
                                        .paddingOnly(top: 2, left: 8, right: 4),
                                  )
                                      .cornerRadiusWithClipRRect(15)
                                      .paddingOnly(left: 8)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 12, right: 16),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LearnerAccepted(mList1[index], index);
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList2.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LearnerPending(mList2[index], index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerPending extends StatelessWidget {
  late LearnerPeopleModel model;

  LearnerPending(LearnerPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(model.img),
                      radius: context.width() * 0.09,
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: model.isOnline
                            ? learner_green
                            : learner_greyColor.withOpacity(1.0),
                        shape: BoxShape.circle,
                        border: Border.all(color: learner_white, width: 1.5),
                      ),
                    ).cornerRadiusWithClipRRect(7).paddingOnly(top: 4, right: 2)
                  ],
                ),
                16.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(model.name,
                          style:
                              boldTextStyle(color: learner_textColorPrimary)),
                      4.width,
                      Text(model.email,
                          style: secondaryTextStyle(
                              color: learner_textColorSecondary)),
                    ],
                  ).paddingOnly(right: 16),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(16),
                        boxShape: BoxShape.circle,
                        backgroundColor: context.cardColor,
                      ),
                      child: Icon(Icons.close,
                          size: 24,
                          color: appStore.isDarkModeOn ? white : black),
                    ),
                    /*    commonCachedNetworkImage(learner_ic_uncheck, height: 40, width: 40).paddingOnly(right: 16).onTap(() {
                      log("uncheck");
                    }),*/
                    16.width,
                    commonCachedNetworkImage(learner_ic_check,
                            height: 40, width: 40)
                        .paddingOnly(right: 8)
                        .onTap(() {
                      LearnerFriendDetail().launch(context);
                    }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerAccepted extends StatelessWidget {
  late LearnerPeopleModel model;

  LearnerAccepted(LearnerPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(model.img),
                    radius: context.width() * 0.09,
                  ),
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: model.isOnline
                            ? learner_green
                            : learner_greyColor.withOpacity(1.0),
                        shape: BoxShape.circle,
                        border: Border.all(color: learner_white, width: 1.5)),
                  ).cornerRadiusWithClipRRect(7).paddingOnly(top: 4, right: 2)
                ],
              ),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(model.name,
                      style: boldTextStyle(color: learner_textColorPrimary)),
                  4.width,
                  Text(model.email,
                      style: secondaryTextStyle(
                          color: learner_textColorSecondary)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
