

// ignore: must_be_immutable
import 'package:nb_utils/nb_utils.dart';

import '../../../../const/consts.dart';
import '../model/QuizModels.dart';
import '../utils/QuizColors.dart';
import '../utils/QuizConstant.dart';

class NewQuiz extends StatelessWidget {
  late NewQuizModel model;

  NewQuiz(NewQuizModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = context.width();

    return Container(
      margin: EdgeInsets.only(left: 16),
      width: w * 0.75,
      decoration: boxDecoration(radius: 16, showShadow: true, bgColor: cardLightColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                child: commonCachedNetworkImage(
                    model.quizImage,
                    height: w * 0.4,
                    width: w * 0.75,
                    fit: BoxFit.cover),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text(model.quizName, fontSize: textSizeMedium, isLongText: true, fontFamily: fontMedium, isCentered: false),
                    text(model.totalQuiz, textColor: quiz_textColorSecondary),
                  ],
                ),
                Icon(Icons.arrow_forward, color: quiz_textColorSecondary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
