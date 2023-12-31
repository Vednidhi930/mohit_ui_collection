import 'package:flutter/material.dart';

class AppModel {
  String? title;
  String? description;
  Color? color;
  String? image;
  List<AppModel>? subKit;
  Widget? widget;
  String? themeType;
  String? tag;

  AppModel({
    this.title,
    this.description,
    this.color,
    this.image,
    this.subKit,
    this.widget,
    this.themeType,
    this.tag,
  });

  factory AppModel.fromJson(Map<String, dynamic> data) {
    return AppModel(
      title: data["title"],
      description: data["description"],
      image: data["image"],
      color: data["color"],
      subKit: data["subKit"],
      widget: data["widget"],
      themeType: data["themeType"],
      tag: data["tag"],
    );
  }

  Map<String?, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return {
      data["title"]: title,
      data["description"]: description,
      data["image"]: image,
      data["color"]: color,
      data["subKit"]: subKit,
      data["widget"]: widget,
      data["themeType"]: themeType,
      data["tag"]: tag,
    };
  }
}
