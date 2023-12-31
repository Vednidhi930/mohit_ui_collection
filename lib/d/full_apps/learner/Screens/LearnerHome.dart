import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppConstant.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../model/LearnerModels.dart';
import '../utils/LearnerColors.dart';
import '../utils/LearnerDataGenerator.dart';
import '../utils/LearnerImages.dart';
import '../utils/LearnerStrings.dart';

class LearnerHome extends StatefulWidget {
  @override
  _LearnerHomeState createState() => _LearnerHomeState();
}

class _LearnerHomeState extends State<LearnerHome> {
  late List<LearnerFeaturedModel> mList1;
  late List<LearnerCategoryModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetFavourites();
    mList2 = learnerGetCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(learner_lbl_featured, style: boldTextStyle()),
                  Text(learner_lbl_see_all,
                      style: boldTextStyle(color: learner_colorPrimary)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 272,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mList1.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16),
                itemBuilder: (context, index) {
                  return LearnerFeatured(mList1[index], index);
                },
              ),
            ),
            // SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: text(learner_lbl_categories,
                  fontFamily: fontBold, fontSize: textSizeNormal),
            ),
            16.height,
            GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList2.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return LearnerCategory(mList2[index], index);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerFeatured extends StatelessWidget {
  late LearnerFeaturedModel model;

  LearnerFeatured(LearnerFeaturedModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = context.width();

    return Container(
      width: context.width() * 0.35,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: commonCachedNetworkImage(
              model.img,
              fit: BoxFit.cover,
              height: w * 0.4,
              width: context.width(),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.name, style: boldTextStyle()),
                4.height,
                Text(model.price,
                    style: primaryTextStyle(color: learner_textColorSecondary)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerCategory extends StatelessWidget {
  late LearnerCategoryModel model;

  LearnerCategory(LearnerCategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          width: context.width(),
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                decoration:
                    boxDecoration(bgColor: context.cardColor, radius: 12),
                child: commonCachedNetworkImage(
                  model.img,
                  height: context.width() * 0.17,
                  width: context.width(),
                ),
              ),
              8.height,
              Text(model.name, style: boldTextStyle()),
            ],
          ),
        ),
      ],
    );
  }
}
