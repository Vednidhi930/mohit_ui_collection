import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

class SDExamCardModel {
  String? image;
  String? examName;
  String? time;
  Widget? icon;
  Color? startColor;
  Color? endColor;

  SDExamCardModel(
      {this.image,
      this.examName,
      this.time,
      this.icon,
      this.startColor,
      this.endColor});
}
