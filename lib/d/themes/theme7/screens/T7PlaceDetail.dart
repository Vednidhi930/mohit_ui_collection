import 'package:flutter/material.dart';
import 'package:mohit_ui_collection/const/strings.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../main/AppConstant.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../models/T7Models.dart';
import '../utils/T7Colors.dart';
import '../utils/T7DataGenerator.dart';
import '../utils/T7Strings.dart';
import '../utils/T7Widget.dart';

class T7PlaceDetail extends StatefulWidget {
  static String tag = '/T7PlaceDetail';

  @override
  T7PlaceDetailState createState() => T7PlaceDetailState();
}

class T7PlaceDetailState extends State<T7PlaceDetail> {
  late List<T7BestHotelDataModel> mListings;
  late List<T7BestHotelDataModel> mListings1;

  @override
  void initState() {
    super.initState();
    mListings = generateBestHotels();
    mListings1 = generateBestHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: context.width(),
            child: commonCachedNetworkImage(
                "${GlobalUrl}images/themes/theme7/island1.jpg",
                fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: context.width() * 0.2),
            child: Container(
              alignment: Alignment.topLeft,
              height: context.height() - 80,
              margin: EdgeInsets.only(top: context.width() / 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: context.scaffoldBackgroundColor),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(t7_best_hotels,
                            textColor: appStore.textPrimaryColor,
                            fontFamily: fontMedium),
                        text(t7_see_all,
                            textColor: appStore.textSecondaryColor),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: context.width() * 0.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mListings.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return hotels(mListings[index], index);
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(t7_popular_hotels,
                            textColor: appStore.textPrimaryColor,
                            fontFamily: fontMedium),
                        text(t7_see_all,
                            textColor: appStore.textSecondaryColor),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.width() * 0.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mListings1.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return hotels(mListings1[index], index);
                        }),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 35, left: 16),
            child: backIcon(context, t7white, Icons.keyboard_arrow_left,
                t7textColorSecondary),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class hotels extends StatelessWidget {
  late T7BestHotelDataModel model;

  hotels(T7BestHotelDataModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16),
          width: width * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: commonCacheImageWidget(model.image, width * 0.28,
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(8),
              ),
              //text(model.name),
              SizedBox(height: 4),
              text(model.name,
                  textColor: appStore.textPrimaryColor, fontSize: 16.0),
              text("Starting From \$399",
                  textColor: t7textColorSecondary, fontSize: textSizeSMedium),
              starText(model.rating, t7textColorSecondary)
            ],
          ),
        ),
      ],
    );
  }
}
