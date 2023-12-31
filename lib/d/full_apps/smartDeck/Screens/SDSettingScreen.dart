import 'package:cached_network_image/cached_network_image.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../const/consts.dart';
import '../ModelClass/LessonsModelClass.dart';
import '../ModelClass/LiveVideoModel.dart';
import '../ModelClass/SDChatsModel.dart';
import '../ModelClass/SDExamCardModel.dart';
import '../ModelClass/SDExamModel.dart';
import '../ModelClass/SDLessonDetailModel.dart';
import '../SDUtils/SDColors.dart';

import '../SDUtils/SDStyle.dart';
import 'SDAllLessonsScreen.dart';
import 'SDCongratulationsScreen.dart';
import 'SDExamScreen.dart';
import 'SDLessonsChapterDetailsScreen.dart';
import 'SDNotificationScreen.dart';
import 'SDSearchScreen.dart';
import 'SdViewAllLivevideoScreen.dart';

class SDSettingScreen extends StatefulWidget {
  @override
  _SDSettingScreenState createState() => _SDSettingScreenState();
}

class _SDSettingScreenState extends State<SDSettingScreen> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(sdPrimaryColor);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(context.cardColor);

    Widget mOption(var icon, var heading) {
      return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: sdIconColor, size: 18),
                16.width,
                Text(heading, style: primaryTextStyle()),
              ],
            ),
            Icon(Icons.keyboard_arrow_right, color: sdIconColor)
          ],
        ),
      );
    }

    Widget mDivider() {
      return Container(color: sdViewColor, height: 1);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: appStore.isDarkModeOn ? white : black),
          title: Text('Settings', style: boldTextStyle(size: 20)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: <Widget>[
            mOption(Icons.language, "Preferences"),
            mDivider(),
            mOption(Icons.lock_outline, "Privacy and Security"),
            mDivider(),
            mOption(Icons.notifications_none, "Notification Settings"),
            mDivider(),
            mOption(Icons.help_outline, "Help Center"),
            mDivider(),
            mOption(Icons.launch, "Logout"),
          ],
        ),
      ),
    );
  }
}
