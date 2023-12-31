import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mohit_ui_collection/const/colors.dart';
import 'package:mohit_ui_collection/const/consts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/utils/dots_indicator/src/dots_decorator.dart';
import '../../../../main/utils/dots_indicator/src/dots_indicator.dart';
import '../../theme1/utils/T1Constant.dart';
import '../utils/T1Colors.dart';
import '../utils/T1DataGenerator.dart';
import '../utils/T1Images.dart';
import '../utils/T1Strings.dart';
import '../utils/T1Widget.dart';
import 'T1Listing.dart';

class T1ImageSlider extends StatefulWidget {
  static var tag = "/T1ImageSlider";

  @override
  T1ImageSliderState createState() => T1ImageSliderState();
}

class T1ImageSliderState extends State<T1ImageSlider> {
  var currentIndexPage = 0;

  // List<T1Slider> mSliderList;
  @override
  void initState() {
    super.initState();
    // mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appBarBackgroundColor);
    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar(context, t1_Image_Slider),
        body: Column(
          children: <Widget>[
            Container(
              width: context.width(),
              height: context.width() * 0.55,
              child: PageView(
                children: <Widget>[
                  Slider(file: city3),
                  Slider(file: city1),
                  Slider(file: city2),
                ],
                onPageChanged: (int i) {
                  setState(() {
                    currentIndexPage = i;
                  });
                },
              ),
            ),
            8.height,
            DotsIndicator(
                dotsCount: 3,
                position: currentIndexPage,
                decorator: DotsDecorator(
                  size: Size.square(8.0),
                  activeSize: Size.square(10.0),
                  color: t1_view_color,
                  activeColor: t1_colorPrimary,
                ))
          ],
        ),
      ),
    );
  }
}

class Slider extends StatelessWidget {
  final String file;

  Slider({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          margin: EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: commonCachedNetworkImage(
            file,
            fit: BoxFit.fill,
          )),
    );
  }
}
