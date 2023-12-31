import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:nb_utils/nb_utils.dart';

import '../model/OPModel.dart';
import '../utils/ATMList.dart';
import '../utils/Colors.dart';
import '../utils/OPDataProvider.dart';
import '../utils/OPWidgets.dart';

class op_ProfileScreen extends StatefulWidget {
  @override
  op_ProfileScreenState createState() => op_ProfileScreenState();
}

class op_ProfileScreenState extends State<op_ProfileScreen> {
  List<OPPickVerifyModel> settingItems = getSettingItems();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (_, index) => Divider(),
        padding: EdgeInsets.all(8),
        itemCount: settingItems.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          OPPickVerifyModel data = settingItems[index];

          return Container(
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(data.icon,
                    size: 20, color: opSecondaryColor.withOpacity(0.6)),
                16.width,
                Text(data.cardTitle!, style: primaryTextStyle()),
              ],
            ),
          );
        },
      ),
    );
  }
}
