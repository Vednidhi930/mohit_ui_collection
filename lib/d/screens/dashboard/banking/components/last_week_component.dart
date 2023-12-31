import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/banking_info_model.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/images.dart';
import 'package:mohit_ui_collection/main/AppStore.dart';
import '../../../../../main/AppWidget.dart';

import 'bottomSheet_component.dart';

class LastWeekComponent extends StatelessWidget {
  const LastWeekComponent({
    Key? key,
    required this.lastWeekData,
    required this.isNegativeSign,
    required this.setLastWeekDetail,
    required this.index,
  }) : super(key: key);

  final int? index;
  final BankingInfoModel lastWeekData;
  final bool isNegativeSign;
  final List<BankingInfoModel> setLastWeekDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('${lastWeekData.lastWeekTitle}', style: boldTextStyle()),
          subtitle: Text('${lastWeekData.lastWeekSubTitle}'),
          horizontalTitleGap: 5,
          dense: true,
          leading: Padding(
            padding: EdgeInsets.only(top: 3),
            child: commonCachedNetworkImage(lastWeekData.lastWeekIcons!,
                height: 35, width: 35),
          ),
          trailing: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: isNegativeSign ? null : bankingLightGreen,
              borderRadius: radius(6),
            ),
            child: Text(
              '${lastWeekData.lastWeekAmount}',
              style: boldTextStyle(
                  color: isNegativeSign ? null : primaryBankingColor2),
            ),
          ),
          onTap: () {
            showModalBottomSheet(
                context: context,
                isDismissible: false,
                shape: RoundedRectangleBorder(
                  borderRadius: radiusOnly(topLeft: 25, topRight: 25),
                ),
                builder: (context) {
                  return BottomSheetDetails(
                    title: lastWeekData.lastWeekTitle,
                    subTitle: lastWeekData.lastWeekSubTitle,
                    icon: lastWeekData.lastWeekIcons,
                    amount: lastWeekData.lastWeekAmount,
                    isNegativeSign: isNegativeSign,
                  );
                });
          },
        ),
        if (setLastWeekDetail.length != index! + 1)
          Divider(
              thickness: 2,
              color: appStore.isDarkModeOn
                  ? dividerBankingBlackColor
                  : dividerBankingColor,
              height: 0),
      ],
    );
  }
}
