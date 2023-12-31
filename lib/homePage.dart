import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohit_ui_collection/Appdata_main.dart';
import 'package:mohit_ui_collection/app_Components/subKit_screen.dart';
import 'package:mohit_ui_collection/const/Lists.dart';
import 'package:mohit_ui_collection/const/consts.dart';
import 'package:mohit_ui_collection/d/full_apps/social/utils/SocialConstant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';

import 'const/images.dart';
import 'models/AppModel.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<AppModel> list = getAppsAndWidgets();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            'Flutter UI Kit',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
          // backgroundColor: Colors.blueAccent.shade100,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            GridView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 18),
                itemBuilder: (context, index) {
                  var item = list[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          //height: 25,
                          margin: EdgeInsets.only(right: 8),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: item.tag.validate().isNotEmpty
                              ? boxDecorationDefault(color: appDarkRed)
                              : BoxDecoration(),
                          child: Text(item.tag.validate(),
                              style: primaryTextStyle(color: white, size: 12)),
                        ),
                      ),
                      Image.asset(
                        home_widget_images_list[index],
                        fit: BoxFit.fill,
                        width: 20,
                        height: 30,
                      )
                          .box
                          .roundedFull
                          .white
                          .padding(EdgeInsets.all(20))
                          .make(),
                      15.heightBox,
                      item.title!.text
                          // .fontFamily(fontMedium)
                          .fontWeight(FontWeight.w600)
                          .color(Colors.black87)
                          .size(16)
                          .make(),
                      10.heightBox,
                      Icon(
                        Icons.arrow_forward,
                        color: icon_colours[index],
                      )
                          .box
                          .white
                          .width(80)
                          .rounded
                          .alignCenter
                          .padding(EdgeInsets.all(3))
                          .make(),
                    ],
                  )
                      .box
                      .color(home_widget_list_COLOURS[index])
                      .rounded
                      .make()
                      .onTap(() {
                    print('pressed  ${item.title}');
                    if (item.subKit.validate().isNotEmpty) {
                      subKit_screen(item, home_widget_list_COLOURS[index])
                          .launch(context);
                    } else {
                      if (item.widget != null) {
                        item.widget.validate().launch(context);
                      } else {
                        print('no widget');
                        Fluttertoast.showToast(
                            msg: 'Coming soon...',
                            toastLength: Toast.LENGTH_SHORT);
                      }
                    }
                  });
                }),
            60.heightBox
          ]).box.padding(const EdgeInsets.all(12)).make(),
        ));
  }
}
