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
import 'BankingAddNewSaving.dart';

class BankingSaving extends StatefulWidget {
  static var tag = "/BankingSaving";

  @override
  _BankingSavingState createState() => _BankingSavingState();
}

class _BankingSavingState extends State<BankingSaving> {
  late List<BankingSavingModel> savingList;

  @override
  void initState() {
    super.initState();
    savingList = bankingSavingList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 60),
              height: context.height(),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.height,
                    Text(Banking_lbl_Saving_Online,
                        style: boldTextStyle(size: 32)),
                    30.height,
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        BankingSavingModel data =
                            savingList[index % savingList.length];
                        return Container(
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          padding: EdgeInsets.all(8),
                          decoration: boxDecorationWithShadow(
                            backgroundColor: context.cardColor,
                            boxShadow: defaultBoxShadow(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Banking_palColor),
                                padding: EdgeInsets.all(16),
                                child: commonCachedNetworkImage(
                                    Banking_ic_piggyBank,
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.fill),
                              ).center(),
                              10.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.title!, style: primaryTextStyle()),
                                  8.height,
                                  Text(data.rs!,
                                      style: primaryTextStyle(
                                          color: Banking_TextColorSecondary)),
                                  2.height,
                                  Text(data.interest!,
                                      style: secondaryTextStyle()),
                                ],
                              ).expand(),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(data.date!,
                                    style: primaryTextStyle(
                                        color: Banking_TextColorSecondary)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: context.width(),
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(
                  backgroundColor: context.cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Banking_palColor),
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.add,
                          size: 20, color: Banking_whitePureColor),
                    ).center(),
                    10.width,
                    Text("Add New Savings", style: primaryTextStyle()).expand(),
                  ],
                ),
              ).onTap(() {
                BankingAddNewSaving().launch(context);
              }),
            )
          ],
        ),
      ),
    );
  }
}
