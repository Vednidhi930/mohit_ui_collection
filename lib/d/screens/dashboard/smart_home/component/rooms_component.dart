import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../main/AppWidget.dart';
import '../models/smart_home_info_model.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import 'package:mohit_ui_collection/main/AppStore.dart';

class RoomsComponent extends StatelessWidget {
  const RoomsComponent({
    Key? key,
    required this.roomData,
  }) : super(key: key);

  final SmartHomeInfoModel roomData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 30,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appStore.isDarkModeOn
            ? Colors.white.withOpacity(0.2)
            : Colors.white.withOpacity(0.5),
        borderRadius: radius(DEFAULT_RADIUS),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: roomData.roomsIconColor!.withOpacity(0.3),
                shape: BoxShape.circle),
            child: commonCachedNetworkImage(roomData.roomsIcons!,
                height: 22, width: 22, color: roomData.roomsIconColor!),
          ),
          8.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${roomData.roomsTitle}', style: primaryTextStyle()),
              5.height,
              Text('${roomData.roomsSubTitle}',
                  style: secondaryTextStyle(
                      color: appStore.isDarkModeOn
                          ? Colors.white70
                          : Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
