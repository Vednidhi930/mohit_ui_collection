// ignore: must_be_immutable
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../const/consts.dart';
import '../model/QuizModels.dart';
import '../utils/QuizColors.dart';
import '../utils/QuizConstant.dart';
import '../utils/QuizDataGenerator.dart';
import '../utils/QuizImages.dart';
import '../utils/QuizStrings.dart';
import '../utils/QuizWidget.dart';
import 'QuizDetails.dart';

class QuizSearch extends StatefulWidget {
  static String tag = '/QuizSearch';

  @override
  _QuizSearchState createState() => _QuizSearchState();
}

class _QuizSearchState extends State<QuizSearch> {
  late List<NewQuizModel> mListings;
  var searchCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
  }

  Widget quizAll() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      scrollDirection: Axis.vertical,
      itemCount: mListings.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          color: cardLightColor,
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: commonCachedNetworkImage(
                  mListings[index].quizImage,
                  height: context.width() * 0.4,
                  width: context.width() / 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              Text(mListings[index].quizName, style: primaryTextStyle())
                  .paddingOnly(top: 8, left: 16, right: 16, bottom: 8),
              4.height,
              Text(
                mListings[index].totalQuiz,
                style: boldTextStyle(color: quiz_textColorSecondary),
              ).paddingOnly(left: 16, right: 16, bottom: 8),
            ],
          ),
        ).cornerRadiusWithClipRRect(16).onTap(
          () {
            QuizDetails().launch(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            quizTopBar('Search'),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                controller: searchCont,
                style: primaryTextStyle(),
                onChanged: (s) {
                  //
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,
                      color: appStore.isDarkModeOn ? white : black),
                  contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  hintText: quiz_lbl_search,
                  filled: true,
                  fillColor: cardLightColor,
                  hintStyle: primaryTextStyle(color: quiz_view_color),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: quiz_app_background, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: quiz_app_background, width: 0.0),
                  ),
                ),
              ),
            ),
            quizAll()
          ],
        ),
      ),
    );
  }
}
