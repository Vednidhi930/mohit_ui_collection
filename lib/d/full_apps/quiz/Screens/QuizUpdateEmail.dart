// ignore: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../const/consts.dart';
import '../model/QuizModels.dart';
import '../utils/QuizColors.dart';
import '../utils/QuizConstant.dart';
import '../utils/QuizDataGenerator.dart';
import '../utils/QuizImages.dart';
import '../utils/QuizStrings.dart';
import '../utils/QuizWidget.dart';

class QuizUpdateEmail extends StatefulWidget {
  static String tag = '/QuizUpdateEmail';

  @override
  _QuizUpdateEmailState createState() => _QuizUpdateEmailState();
}

class _QuizUpdateEmailState extends State<QuizUpdateEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(quiz_lbl_Update_email,
            fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: quiz_colorPrimary, size: 24),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: context.height(),
            child: Column(
              children: <Widget>[
                16.height,
                text(quiz_info_Update_email,
                        textColor: quiz_textColorSecondary,
                        isLongText: true,
                        isCentered: true)
                    .center(),
                Container(
                  margin: EdgeInsets.all(24.0),
                  decoration: boxDecoration(
                      bgColor: cardLightColor, showShadow: true, radius: 10),
                  child: Column(
                    children: <Widget>[
                      quizEditTextStyle(quiz_hint_your_email,
                          isPassword: false),
                    ],
                  ),
                ),
                8.height,
                Text(quiz_lbl_email_Verify, style: secondaryTextStyle()).onTap(
                  () {
                    finish(context);
                  },
                ),
                50.height,
                Container(
                  margin: EdgeInsets.all(24.0),
                  child: quizButton(
                    textContent: quiz_lbl_save,
                    onPressed: () {
                      setState(
                        () {
                          finish(context);
                          toasty(context, quiz_Successfully_Email_Updated);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
