import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mohit_ui_collection/const/consts.dart';
import 'package:mohit_ui_collection/d/themes/theme12/utils/t12_images.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../../../main/utils/dots_indicator/src/dots_decorator.dart';
import '../../../../main/utils/dots_indicator/src/dots_indicator.dart';
import '../../theme2/utils/T2BubbleBotoomBar.dart';
import '../model/T5Models.dart';
import '../utils/T5Colors.dart';
import '../utils/T5DataGenerator.dart';
import '../utils/T5Images.dart';
import '../utils/T5Strings.dart';
import '../utils/T5Widget.dart';
import '../utils/T5Constant.dart';
import '../utils/widgets/T5BottomBar.dart';
import '../utils/widgets/T5GridListing.dart';
import '../utils/widgets/T5Slider.dart';

class T5WalkThrough extends StatefulWidget {
  static var tag = "/T5WalkThrough";

  @override
  T5WalkThroughState createState() => T5WalkThroughState();
}

class T5WalkThroughState extends State<T5WalkThrough> {
  int currentIndexPage = 0;
  var titles = [
    t5_quickly_and_easily,
    t5_shopping_online,
    t5_manage_your_finance,
    t5_welcome_to_mollet
  ];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          width: context.width(),
          height: context.height(),
          child: PageView(
            children: <Widget>[
              WalkThrough(
                  textContent: t5_quickly_and_easily,
                  bgImg: t5_bg_walk_1,
                  walkImg: t12_walk),
              WalkThrough(
                  textContent: t5_shopping_online,
                  bgImg: t5_walk_2,
                  walkImg: t12_walk),
              WalkThrough(
                  textContent: t5_manage_your_finance,
                  bgImg: t5_bg_walk_3,
                  walkImg: t12_walk),
              WalkThrough(textContent: t5_welcome_to_mollet, walkImg: t12_walk),
            ],
            onPageChanged: (value) {
              setState(() => currentIndexPage = value);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: DotsIndicator(
                dotsCount: 4,
                position: currentIndexPage,
                decorator: DotsDecorator(
                  size: Size.square(8.0),
                  activeSize: Size.square(12.0),
                  color: t5ViewColor,
                  activeColor: t5ColorPrimary,
                )),
          ),
        )
      ],
    ));
  }
}

class WalkThrough extends StatelessWidget {
  final String? textContent;
  final String? bgImg;
  final String? walkImg;

  WalkThrough({Key? key, this.textContent, this.bgImg, this.walkImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = context.height();
    var width = context.width();

    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: h,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: h * 0.05),
                height: h * 0.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    bgImg != null
                        ? commonCachedNetworkImage(bgImg!,
                            width: width, height: h * 0.5, fit: BoxFit.fill)
                        : Container(),
                    commonCachedNetworkImage(
                      walkImg!,
                      width: width * 0.8,
                      height: h * 0.6,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.08,
              ),
              text(textContent,
                  textColor: appStore.textPrimaryColor,
                  fontSize: textSizeNormal,
                  fontFamily: fontMedium),
              Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0),
                child: text(Mohit_UI_KitShortText,
                    fontSize: textSizeMedium, maxLine: 3, isCentered: true),
              )
            ],
          ),
        ),
        bgImg == null
            ? Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    toasty(context, "Sign in clicked");
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 50),
                    alignment: Alignment.center,
                    height: width / 8,
                    child:
                        text(t5_sign_in, textColor: t5White, isCentered: true),
                    decoration:
                        boxDecoration(bgColor: t5ColorPrimary, radius: 8),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
