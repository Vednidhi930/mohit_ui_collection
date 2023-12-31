import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';

import '../utils/T14Colors.dart';
import '../utils/T14DataGenerator.dart';
import '../utils/T14Images.dart';
import '../utils/T14Strings.dart';
import '../utils/T14Widget.dart';
import 'T14ChattingScreen.dart';

class T14RateScreen extends StatefulWidget {
  @override
  _T14RateScreenState createState() => _T14RateScreenState();
}

class _T14RateScreenState extends State<T14RateScreen> {
  double _currentSliderValue = 20;

  @override
  void initState() {
    super.initState();

    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  String? rateType;

  String getRate(double num) {
    if (num == 0) {
      return rateType = "Bad";
    } else if (num == 25) {
      return rateType = "Upsad";
    } else if (num == 50) {
      return rateType = "Nice";
    } else if (num == 75) {
      return rateType = "Fabulous";
    } else {
      return rateType = "Awesome";
    }
  }

  String? rateImg;

  String getRateImg(double num) {
    if (num == 0) {
      return rateImg = t14_bad;
    } else if (num == 25) {
      return rateImg = t14_upSad;
    } else if (num == 50) {
      return rateImg = t14_nice;
    } else if (num == 75) {
      return rateImg = t14_nice;
    } else {
      return rateImg = t14_nice;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(t14_txt_RateUs,
            style: boldTextStyle(size: 18, color: t14_colorBlue)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.close, size: 20),
              onPressed: () {
                finish(context);
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(t14_txt_RateUs_Title,
              textAlign: TextAlign.center,
              style: boldTextStyle(color: t14_colorBlue, size: 28)),
          commonCachedNetworkImage(getRateImg(_currentSliderValue),
              height: 200, fit: BoxFit.cover),
          Column(
            children: [
              Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 100,
                  activeColor: t14_OppsColor,
                  divisions: 4,
                  label: getRate(_currentSliderValue),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  }),
              32.height,
              t14AppButton(
                context,
                btnText: t14_txt_Save,
                bgColor: t14_SignInBgColor,
                width: context.width(),
                shape: 10.0,
                txtColor: t14_colorSkyBlue,
              ),
            ],
          )
        ],
      ).paddingAll(16),
    );
  }
}
