import 'package:cached_network_image/cached_network_image.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../const/consts.dart';
import '../ModelClass/LessonsModelClass.dart';
import '../ModelClass/LiveVideoModel.dart';
import '../ModelClass/SDChatsModel.dart';
import '../ModelClass/SDExamCardModel.dart';
import '../ModelClass/SDExamModel.dart';
import '../ModelClass/SDLessonDetailModel.dart';
import '../ModelClass/SDSearchModel.dart';
import '../SDUtils/SDColors.dart';

import '../SDUtils/SDStyle.dart';
import 'SDAllLessonsScreen.dart';
import 'SDCongratulationsScreen.dart';
import 'SDExamScreen.dart';
import 'SDLessonsChapterDetailsScreen.dart';
import 'SDNotificationScreen.dart';
import 'SDSearchScreen.dart';
import 'SdViewAllLivevideoScreen.dart';

class SDSearchScreen extends StatefulWidget {
  @override
  _SDSearchScreenState createState() => _SDSearchScreenState();
}

class _SDSearchScreenState extends State<SDSearchScreen> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: boxDecorations(
                            radius: 6, bgColor: sdViewColor.withOpacity(0.8)),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        finish(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text("Cancel",
                            style: primaryTextStyle(color: sdPrimaryColor)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Text("Search history", style: secondaryTextStyle()),
              ),
              ListView.builder(
                itemCount: searchList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: sdSecondaryColorRed),
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.star,
                                      color: Colors.white, size: 12),
                                ),
                                16.width,
                                Text(searchList[index].value!,
                                    style: primaryTextStyle()),
                              ],
                            ),
                            Icon(Icons.keyboard_arrow_right, color: sdIconColor)
                          ],
                        ),
                      ),
                      Container(
                        color: sdViewColor,
                        height: 1,
                        margin: EdgeInsets.only(top: 16, bottom: 16),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
