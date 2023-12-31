import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../model/SocialModel.dart';
import '../utils/SocialColors.dart';
import '../utils/SocialConstant.dart';
import '../utils/SocialDataGenerator.dart';
import '../utils/SocialImages.dart';
import '../utils/SocialStrings.dart';
import '../utils/SocialWidget.dart';

class SocialVerify extends StatefulWidget {
  static String tag = '/SocialVerify';

  @override
  SocialVerifyState createState() => SocialVerifyState();
}

class SocialVerifyState extends State<SocialVerify> {
  late List<Qr> mList;

  @override
  void initState() {
    super.initState();
    mList = addQrData();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mTop(context, social_lbl_verify_security_code),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(spacing_standard_new),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: commonCachedNetworkImage(social_ic_qr,
                          width: width * 0.3, height: width * 0.3),
                    ),
                    SizedBox(height: spacing_standard_new),
                    Expanded(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 2,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: mList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: text(mList[index].code.toString(),
                                textColor: social_textColorSecondary,
                                isCentered: true),
                          );
                        },
                      ),
                    ),
                    text(social_sample_long_text,
                        isLongText: true, textColor: social_textColorSecondary),
                    SizedBox(height: spacing_standard_new),
                    Container(
                      decoration: boxDecoration(
                        bgColor: social_colorPrimary,
                        showShadow: true,
                      ),
                      padding: EdgeInsets.fromLTRB(spacing_standard,
                          spacing_middle, spacing_standard, spacing_middle),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.crop_free,
                                  color: social_white,
                                  size: 18,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: social_lbl_scan_qr_code,
                                style: TextStyle(
                                    fontSize: textSizeMedium,
                                    color: social_white)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
