import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:mohit_ui_collection/const/consts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppConstant.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../../../main/utils/dots_indicator/src/dots_decorator.dart';
import '../../../../main/utils/dots_indicator/src/dots_indicator.dart';
import '../../../../main/utils/flutter_rating_bar.dart';
import '../model/LearnerModels.dart';
import '../utils/LearnerColors.dart';
import '../utils/LearnerDataGenerator.dart';
import '../utils/LearnerImages.dart';
import '../utils/LearnerStrings.dart';
import '../utils/LearnerWidget.dart';
import 'LearnerDashboard.dart';
import 'LearnerLogin.dart';

class LearnerWalkThrough extends StatefulWidget {
  static String tag = '/learner';

  @override
  _LearnerWalkThroughState createState() => _LearnerWalkThroughState();
}

class _LearnerWalkThroughState extends State<LearnerWalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;
  var titles = ['Welcome', 'Select Course', 'Learn Topics'];
  var subTitles = [
    Mohit_UI_KitShortText,
    Mohit_UI_KitShortText,
    Mohit_UI_KitShortText
  ];

  List<LearnerWalk>? mList1;

  @override
  void initState() {
    super.initState();
    mList1 = learnerWalkImg();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 24),
              width: MediaQuery.of(context).size.width,
              child: PageView(
                children: <Widget>[
                  WalkThrough(textContent: learner_walk_1),
                  WalkThrough(textContent: learner_walk_2),
                  WalkThrough(textContent: learner_walk_3),
                ],
                onPageChanged: (value) {
                  setState(() => currentIndexPage = value);
                },
              ),
            ),
            Positioned(
              width: context.width(),
              height: 50,
              top: context.height() * 0.45,
              child: Align(
                alignment: Alignment.center,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndexPage,
                  decorator: DotsDecorator(
                      color: learner_greyColor,
                      activeColor: learner_colorPrimary),
                ),
              ),
            ),
            Positioned(
              width: context.width(),
              top: context.height() * 0.5,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(titles[currentIndexPage],
                        style: boldTextStyle(
                            size: 20, color: learner_textColorPrimary)),
                    SizedBox(height: 10),
                    Text(
                      subTitles[currentIndexPage],
                      style: primaryTextStyle(
                          size: 18, color: learner_textColorSecondary),
                      textAlign: TextAlign.center,
                    ).center(),
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        alignment: Alignment.center,
                        child: LearnerButton(
                          onPressed: () {
                            LearnerDashboard().launch(context);
                          },
                          textContent: learner_Get_Started,
                        ),
                      ),
                    ),
                    16.height,
                    Text(
                      "Login",
                      style: primaryTextStyle(
                          decoration: TextDecoration.underline,
                          color: learner_greyColor),
                    ).onTap(
                      () {
                        LearnerLogin().launch(context);
                      },
                    )
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Container(
                width: context.width(),
                height: 60,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;

  WalkThrough({Key? key, required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            commonCachedNetworkImage(learner_walk_BackImg,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) * 0.4),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) * 0.4,
                alignment: Alignment.center,
                child: commonCachedNetworkImage(
                  textContent,
                  width: 300,
                  height: (MediaQuery.of(context).size.height) * 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
