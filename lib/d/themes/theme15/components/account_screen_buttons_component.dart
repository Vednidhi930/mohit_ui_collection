import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../../const/strings.dart';
import '../../../../main/AppWidget.dart';

class AccountScreenButtonComponent extends StatelessWidget {
  AccountScreenButtonComponent({Key? key}) : super(key: key);
  List buttonName = [
    "Home",
    "Donation",
    "Favorites",
    "Messages",
    "Profile",
    "Notification",
  ];
  List icon = [
    "${GlobalUrl}images/themes/theme15/icons/homepage.png",
    "${GlobalUrl}images/themes/theme15/icons/donation.png",
    "${GlobalUrl}images/themes/theme15/icons/heart.png",
    "${GlobalUrl}images/themes/theme15/icons/chat_icon.png",
    "${GlobalUrl}images/themes/theme15/icons/user.png",
    "${GlobalUrl}images/themes/theme15/icons/bell.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Wrap(
        runSpacing: 4,
        children: List.generate(
          buttonName.length,
          (index) {
            return InkWell(
              borderRadius: BorderRadius.circular(12),
              radius: 12,
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(top: 12, bottom: 12),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    commonCachedNetworkImage(
                      icon[index],
                      height: 25,
                      width: 25,
                      color: Colors.grey,
                    ),
                    16.width,
                    Text(
                      buttonName[index],
                      style: primaryTextStyle(size: 18),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
