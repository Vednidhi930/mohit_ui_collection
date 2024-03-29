import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppConstant.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../../../main/utils/flutter_rating_bar.dart';
import '../health_medical/screens/health_medical_dashboard.dart';
import '../model/db1/Db1Model.dart';
import '../model/db5/Db5Model.dart';
import '../utils/Db5BottomNavigationBar.dart';
import '../utils/DbColors.dart';
import '../utils/DbDataGenerator.dart';
import '../utils/DbImages.dart';
import '../utils/DbStrings.dart';

class Dashboard5 extends StatefulWidget {
  static String tag = '/hotel_booking';

  final bool isDirect;

  Dashboard5({this.isDirect = false});

  @override
  Dashboard5State createState() => Dashboard5State();
}

class Dashboard5State extends State<Dashboard5> {
  late List<Db5CategoryData> mListings;
  late List<Db6BestDestinationData> mListings1;
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    mListings = generateCategories();
    mListings1 = generateBestDestination();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(db5_colorPrimary);
    return Scaffold(
      backgroundColor: db5_white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: dbShadowColor,
                offset: Offset.fromDirection(3, 1),
                spreadRadius: 1,
                blurRadius: 5),
          ],
        ),
        child: Db5BottomNavigationBar(
          items: <Db5BottomNavigationBarItem>[
            Db5BottomNavigationBarItem(
              icon: db5_ic_home,
            ),
            Db5BottomNavigationBarItem(
              icon: db5_ic_compass,
            ),
            Db5BottomNavigationBarItem(
              icon: db5_ic_msg,
            ),
            Db5BottomNavigationBarItem(
              icon: db5_ic_setting,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: db5_icon_color, size: 24),
          selectedIconTheme: IconThemeData(color: db5_colorPrimary, size: 24),
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: Db5BottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      finish(context);
                    },
                    visualDensity: VisualDensity.compact,
                    icon: Icon(Icons.arrow_back),
                  ),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(db5_hi_juila,
                          style: primaryTextStyle(
                              size: 20, color: db5_colorPrimary)),
                      Text(db5_you_are_in_54_king_ports,
                          style: primaryTextStyle(
                              color: db5_textColorSecondary, size: 14)),
                    ],
                  ).expand(),
                  Icon(Icons.search, color: db5_icon_color),
                ],
              ),
            ),
            ScrollConfiguration(
              behavior: AppScrollBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 16),
                    HorizontalList(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      wrapAlignment: WrapAlignment.start,
                      itemCount: mListings.length,
                      itemBuilder: (context, index) =>
                          category(mListings[index]),
                    ),
                    SizedBox(height: 8),
                    Divider(height: 4, color: db5_viewColor, thickness: 2),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(db5_best_destination,
                              style: primaryTextStyle(
                                  color: db5_colorPrimary, size: 24)),
                          Text(db5_see_All.toUpperCase(),
                              style: primaryTextStyle(
                                  color: db5_textColorSecondary)),
                        ],
                      ),
                    ),
                    Container(
                      width: context.width(),
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        primary: false,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                        itemCount: mListings1.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          margin: EdgeInsets.only(left: 4, bottom: 4, top: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                commonCachedNetworkImage(
                                    mListings1[index].image),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(mListings1[index].name,
                                          style:
                                              primaryTextStyle(color: white)),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: db5_black_trans,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 4, 10, 4),
                                          child: RichText(
                                            text: TextSpan(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                              children: [
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.0),
                                                    child: Icon(
                                                        Icons.star_border,
                                                        color: db5_yellow,
                                                        size: 16),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      mListings1[index].rating,
                                                  style: secondaryTextStyle(
                                                      size: 14,
                                                      color: db5_white,
                                                      fontFamily: fontMedium),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //    SizedBox(height: 50,)
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

// ignore: must_be_immutable, camel_case_types
class category extends StatelessWidget {
  late Db5CategoryData model;

  category(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: db5_light_blue,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SvgPicture.network(model.image, height: 40, width: 40),
            ),
          ),
          SizedBox(height: 4),
          Text(model.name,
              style: primaryTextStyle(color: db5_textColorSecondary))
        ],
      ),
    );
  }
}
