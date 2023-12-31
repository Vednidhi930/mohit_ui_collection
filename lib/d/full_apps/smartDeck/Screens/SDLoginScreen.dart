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
import 'SDForgotPwdScreen.dart';
import 'SDHomePageScreen.dart';
import 'SDLessonsChapterDetailsScreen.dart';
import 'SDNotificationScreen.dart';
import 'SDRegisterScreen.dart';
import 'SDSearchScreen.dart';
import 'SdViewAllLivevideoScreen.dart';

class SDLoginScreen extends StatefulWidget {
  @override
  _SDLoginScreenState createState() => _SDLoginScreenState();
}

class _SDLoginScreenState extends State<SDLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Easy to learn \nanywhere and anytime',
                    style: boldTextStyle(size: 25)),
                SizedBox(height: 25),
                Text('Sign in to your account',
                    style: secondaryTextStyle(size: 16)),
                SizedBox(height: 25),
                Container(
                  decoration: boxDecorations(color: context.cardColor),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        cursorColor: sdTextSecondaryColor.withOpacity(0.2),
                        cursorWidth: 1,
                        autocorrect: true,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Username or Mobile number',
                          hintStyle: secondaryTextStyle(
                              color: sdTextSecondaryColor.withOpacity(0.6)),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 16, bottom: 16, top: 16, right: 16),
                        ),
                      ),
                      Divider(height: 1, thickness: 1),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              obscureText: true,
                              cursorColor:
                                  sdTextSecondaryColor.withOpacity(0.2),
                              cursorWidth: 1,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: secondaryTextStyle(
                                    color:
                                        sdTextSecondaryColor.withOpacity(0.6)),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 16, bottom: 16, top: 16, right: 16),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              SDForgotPwdScreen().launch(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Text('Forgot?',
                                  style: boldTextStyle(
                                      size: 14, color: sdPrimaryColor)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                44.height,
                SDButton(
                  textContent: "SIGN IN",
                  onPressed: () {
                    SDHomePageScreen().launch(context);
                  },
                ),
                16.height,
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        Container(
          height: 40,
          padding: EdgeInsets.only(left: 15, right: 15),
          width: MediaQuery.of(context).copyWith().size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Don\'t have an account?', style: secondaryTextStyle()),
              TextButton(
                onPressed: () {
                  sdRegisterScreen().launch(context);
                },
                child: Text('REGISTER',
                    style: boldTextStyle(size: 14, color: sdPrimaryColor)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
