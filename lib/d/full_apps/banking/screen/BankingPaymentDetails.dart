import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:nb_utils/nb_utils.dart';
import '../../../../main/AppStore.dart';
import '../model/BankingModel.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingDataGenerator.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingSlider.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';
import 'BankingPayInvoice.dart';
import 'BankingPaymentHistory.dart';

// ignore: must_be_immutable
class BankingPaymentDetails extends StatefulWidget {
  static var tag = "/BankingPaymentDetails";
  String? headerText;

  BankingPaymentDetails({this.headerText});

  @override
  _BankingPaymentDetailsState createState() => _BankingPaymentDetailsState();
}

class _BankingPaymentDetailsState extends State<BankingPaymentDetails> {
  late List<BankingPaymentModel> mList;

  @override
  void initState() {
    super.initState();
    mList = bankingPaymentDetailList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.chevron_left,
                    size: 25,
                    color: appStore.isDarkModeOn ? white : Banking_blackColor,
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  16.height,
                  Text(
                    widget.headerText!,
                    style: boldTextStyle(
                        size: 30,
                        color: appStore.isDarkModeOn
                            ? white
                            : Banking_TextColorPrimary),
                  ),
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    decoration: boxDecorationWithShadow(
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: context.cardColor,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          padding: EdgeInsets.all(16),
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.circular(30),
                            backgroundColor: Banking_Primary,
                          ),
                          child: commonCachedNetworkImage(
                            mList[index].img!,
                            height: 20,
                            width: 20,
                            color: Banking_whitePureColor,
                          ),
                        ).paddingAll(spacing_standard),
                        Text(mList[index].title!, style: primaryTextStyle()),
                      ],
                    ),
                  ).onTap(
                    () {
                      if (index == 0) {
                        BankingPayInvoice().launch(context);
                      } else {
                        BankingPaymentHistory().launch(context);
                      }
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
