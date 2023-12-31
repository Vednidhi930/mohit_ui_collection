import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../main/AppWidget.dart';
import '../../../../main/AppStore.dart';
import '../../theme2/utils/T2BubbleBotoomBar.dart';
import '../model/T5Models.dart';
import '../utils/T5Colors.dart';
import '../utils/T5DataGenerator.dart';
import '../utils/T5Images.dart';
import '../utils/T5Strings.dart';
import '../utils/T5Widget.dart';
import '../utils/T5Constant.dart';
import '../utils/widgets/T5BottomBar.dart';
import '../utils/widgets/T5GridListing.dart';
import '../utils/widgets/T5Slider.dart';

class T5Search extends StatefulWidget {
  static String tag = '/search_contact_list';

  final bool isDirect;

  T5Search({this.isDirect = false});

  @override
  T5SearchState createState() => T5SearchState();
}

class T5SearchState extends State<T5Search> {
  List<T5Contact> mRecentContact = [];
  List<T5Contact> mOtherContact = [];

  @override
  void initState() {
    super.initState();
    mRecentContact = getRecents();
    mOtherContact = getPending();
  }

  Widget contactList(List<T5Contact> mContactList) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: mContactList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(mContactList[index].img),
                      radius: 28,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          text(mContactList[index].name,
                              textColor: appStore.textPrimaryColor,
                              fontSize: textSizeMedium,
                              fontFamily: fontMedium),
                          text(mContactList[index].contactno,
                              fontSize: textSizeMedium)
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 0.5, color: t5ViewColor)
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(titleName: t5_contact_list, isDirect: widget.isDirect),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                style: TextStyle(
                    fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: appStore.iconColor),
                  contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  hintText: t5_hint_search,
                  hintStyle: TextStyle(color: appStore.textPrimaryColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: t5ViewColor, width: 0.7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: t5ViewColor, width: 0.7),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(t5_recently_contact,
                          textColor: appStore.textPrimaryColor,
                          fontSize: textSizeNormal,
                          fontFamily: fontBold),
                      Container(child: contactList(mRecentContact)),
                      SizedBox(height: 26),
                      text(t5_other_contact,
                          textColor: appStore.textPrimaryColor,
                          fontSize: textSizeNormal,
                          fontFamily: fontBold),
                      Container(child: contactList(mOtherContact)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
