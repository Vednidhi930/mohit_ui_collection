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

class SDSortScreen extends StatefulWidget {
  @override
  _SDSortScreenState createState() => _SDSortScreenState();
}

class _SDSortScreenState extends State<SDSortScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: appStore.isDarkModeOn ? white : black),
          title: Text('Sort By', style: boldTextStyle(size: 20)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: true,
        ),
        body: Stack(
          children: [
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: mFilterList.length,
                padding: EdgeInsets.only(top: 16.0),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mFilterList[index].isSelected
                                  ? mFilterList[index].isSelected = false
                                  : mFilterList[index].isSelected = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(mFilterList[index].value!,
                                  style: primaryTextStyle()),
                              Container(
                                padding: EdgeInsets.all(4),
                                child: mFilterList[index].isSelected
                                    ? Icon(Icons.radio_button_checked,
                                        color: sdPrimaryColor, size: 22)
                                    : Icon(Icons.radio_button_unchecked,
                                        color: sdPrimaryColor, size: 22),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Divider(color: sdViewColor, thickness: 1, height: 1)
                      ],
                    ),
                  );
                }),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(16.0),
              child: SDButton(
                textContent: "SAVE",
                onPressed: () {
                  finish(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
