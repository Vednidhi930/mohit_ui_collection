import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

class OPPickVerifyModel {
  String? image;
  String? cardTitle;
  String? cardSubTitle;
  Color? cardColor;
  String? cardExpireDate;
  String? cardNumber;
  IconData? icon;
  Widget? newScreen;

  OPPickVerifyModel(
      {this.image,
      this.cardTitle,
      this.cardSubTitle,
      this.cardColor,
      this.cardExpireDate,
      this.cardNumber,
      this.icon,
      this.newScreen});
}
