import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../main/AppWidget.dart';
import '../models/smart_home_info_model.dart';

import 'package:mohit_ui_collection/main/AppStore.dart';

class UsageHistoryComponent extends StatelessWidget {
  const UsageHistoryComponent({
    Key? key,
    required this.usageHistoryData,
  }) : super(key: key);

  final SmartHomeInfoModel usageHistoryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 16,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 8,
        title: RichText(
          text: TextSpan(
            text: '${usageHistoryData.usageHistoryTitle}  ',
            style: boldTextStyle(size: 18),
            children: [
              TextSpan(
                text: '${usageHistoryData.usageHistoryUnit}',
                style: secondaryTextStyle(
                    color:
                        appStore.isDarkModeOn ? Colors.white70 : Colors.black),
              ),
            ],
          ),
        ),
        subtitle: Text(
          '${usageHistoryData.usageHistorySubTitle}',
          style: secondaryTextStyle(
              color: appStore.isDarkModeOn ? Colors.white70 : Colors.black),
        ),
        leading: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: appStore.isDarkModeOn
                ? Colors.white.withOpacity(0.2)
                : Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
          ),
          child: commonCachedNetworkImage(
            usageHistoryData.usageHistoryIcons!,
            height: 20,
            width: 20,
            color: appStore.isDarkModeOn ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
