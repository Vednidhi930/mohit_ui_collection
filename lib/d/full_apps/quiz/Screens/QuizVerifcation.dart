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
import 'QuizNotification.dart';

class QuizVerification extends StatefulWidget {
  static String tag = '/QuizMobileVerification';

  @override
  _QuizVerificationState createState() => _QuizVerificationState();
}

class _QuizVerificationState extends State<QuizVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz_title_Verification, style: boldTextStyle()),
        leading:
            Icon(Icons.arrow_back, color: quiz_colorPrimary, size: 24).onTap(
          () {
            finish(context);
          },
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: context.height(),
            child: Column(
              children: <Widget>[
                16.height,
                Text(
                  quiz_info_Verification,
                  style: boldTextStyle(color: quiz_textColorSecondary),
                  textAlign: TextAlign.center,
                ).center(),
                16.height,
                PinEntryTextField(fields: 4, fontSize: textSizeLargeMedium)
                    .center(),
                24.height,
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(quiz_lbl_did_not_receive_code,
                          style: primaryTextStyle()),
                      4.height,
                      Text(quiz_lbl_Resend,
                          style: boldTextStyle(color: quiz_colorPrimary)),
                    ],
                  ),
                ).onTap(() {}),
                16.height,
                Container(
                  margin: EdgeInsets.all(24.0),
                  child: quizButton(
                    textContent: quiz_lbl_continue,
                    onPressed: () {
                      setState(
                        () {
                          QuizNotification().launch(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
