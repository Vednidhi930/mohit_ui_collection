import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../const/consts.dart';
import '../utils/BHImages.dart';
import '../utils/BHDataProvider.dart';
import '../utils/BHConstants.dart';
import '../utils/BHWidgets.dart';
import '../model/BHModel.dart';
import 'BHChatScreen.dart';
import 'BHVideoCallingScreen.dart';

class BHMessagesScreen extends StatefulWidget {
  static String tag = '/MessagesBottomNavigationBarScreen';

  @override
  BHMessagesScreenState createState() => BHMessagesScreenState();
}

class BHMessagesScreenState extends State<BHMessagesScreen>
    with SingleTickerProviderStateMixin {
  late List<MessageModel> messageList;
  late List<BHCallModel> callList;

  @override
  void initState() {
    super.initState();
    messageList = getMessageList();
    callList = getCallList();
  }

  Widget chatMassagesWidget() {
    return Container(
      color: BHGreyColor.withOpacity(0.1),
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    autofocus: false,
                    style: TextStyle(fontSize: 16.0, color: BHGreyColor),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: BHGreyColor),
                      fillColor: cardLightColor,
                      hintText: 'Search',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ).expand(),
                ),
                16.width,
                Container(
                  child: commonCachedNetworkImage(BHMessageIcon,
                      width: 30, height: 30),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: cardLightColor),
                ),
              ],
            ),
            16.height,
            ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: BHGreyColor.withOpacity(0.3), indent: 6),
              itemCount: messageList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    messageList[index].img.validate().startsWith('http')
                        ? Image.network(messageList[index].img!)
                        : CircleAvatar(
                            backgroundImage:
                                AssetImage(messageList[index].img!),
                            radius: 25),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(messageList[index].name!,
                              style: boldTextStyle(size: 14)),
                        ),
                        8.height,
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(messageList[index].message!,
                              style:
                                  TextStyle(fontSize: 12, color: BHGreyColor)),
                        ),
                      ],
                    ).expand(),
                    Text(messageList[index].lastSeen!,
                        style: secondaryTextStyle()),
                  ],
                ).onTap(() {
                  String? img = messageList[index].img;
                  String? name = messageList[index].name;
                  BHChatScreen(img: img, name: name).launch(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget callsWidget() {
    return Container(
      color: BHGreyColor.withOpacity(0.1),
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                autofocus: false,
                style: TextStyle(fontSize: 16.0, color: BHGreyColor),
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: BHGreyColor),
                  fillColor: cardLightColor,
                  hintText: 'Search',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: whiteColor),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: BHGreyColor.withOpacity(0.3), indent: 5),
              physics: NeverScrollableScrollPhysics(),
              itemCount: callList.length,
              padding: EdgeInsets.only(top: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    callList[index].img.validate().startsWith('http')
                        ? Image.network(
                            callList[index].img!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ).cornerRadiusWithClipRRect(25)
                        : CircleAvatar(
                            backgroundImage: AssetImage(callList[index].img!),
                            radius: 25),
                    8.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(callList[index].name!,
                              style: boldTextStyle(size: 14)),
                          8.height,
                          Row(
                            children: [
                              Icon(callList[index].callImg, size: 14),
                              8.width,
                              Text(
                                callList[index].callStatus!,
                                style: TextStyle(
                                    color: BHAppTextColorSecondary,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: commonCachedNetworkImage(
                              callList[index].videoCallIcon!,
                              height: 40,
                              width: 40),
                          onPressed: () {
                            BHVideoCallingScreen().launch(context);
                          },
                        ),
                        IconButton(
                          icon: commonCachedNetworkImage(
                              callList[index].audioCallIcon!,
                              height: 40,
                              width: 40),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          labelColor: BHColorPrimary,
          unselectedLabelColor:
              appStore.isDarkModeOn ? white : BHAppTextColorPrimary,
          indicatorColor: BHColorPrimary,
          onTap: (index) {},
          tabs: [
            Tab(child: Text(BHTabMessages, style: TextStyle(fontSize: 14))),
            Tab(child: Text(BHTabCalls, style: TextStyle(fontSize: 14))),
          ],
        ),
        body: TabBarView(children: [
          chatMassagesWidget(),
          callsWidget(),
        ]),
      ),
    );
  }
}
