import 'package:flutter/services.dart';
import 'package:mohit_ui_collection/d/full_apps/grocery/utils/GroceryConstant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../const/consts.dart';
import '../main/AppStore.dart';

class subKit_screen extends StatefulWidget {
  static String tag = '/SubKitScreen';
  final AppModel? item;
  final Color? color;

  subKit_screen(this.item, this.color);

  @override
  State<subKit_screen> createState() => _subKit_screenState();
}

class _subKit_screenState extends State<subKit_screen> {
  // @override
  // void initState() {
  //   setStatusBarColor(widget.color!, statusBarIconBrightness: Brightness.dark);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // Set status bar color here
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: widget.color!, // Set your desired status bar color here
    //   statusBarBrightness:
    //       Brightness.light, // Change the status bar brightness if needed
    // ));
    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(
        title: Text(
          widget.item!.title!,
          style: TextStyle(fontFamily: fontSemiBold),
        ),
        centerTitle: true,
        backgroundColor: widget.color,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: context.height()),
          child: Container(
            height: widget.item!.subKit.validate().length * 100,
            // height: context.height(),
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.only(
              top: 20,
            ),
            decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),

            //listview
            child: ListView.builder(
                // primary: false,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.item!.subKit.validate().length,
                itemBuilder: (context, index) {
                  //
                  List<AppModel> subkit = widget.item!.subKit.validate();
                  var subitem = subkit[index];
                  // Sort the list based on the tag property
                  //
                  //get color
                  Color get_color = home_widget_list_COLOURS[index + 2];

                  return Container(
                    width: context.width(),
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    // padding: const EdgeInsets.symmetric(
                    //     vertical: 10, horizontal: 16),
                    // //
                    // decoration: BoxDecoration(
                    //     color: get_color,
                    //     borderRadius: BorderRadius.circular(15)),
                    //
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image.asset(
                        //   home_widget_images_list[index],
                        //   fit: BoxFit.fill,
                        //   width: 15,
                        //   height: 25,
                        // )
                        //     .box
                        //     .roundedFull
                        //     .white
                        //     .padding(EdgeInsets.all(15))
                        //     .make(),
                        // 12.widthBox,
                        // Expanded(
                        //     child: Text(
                        //   subitem.title!,
                        //   softWrap: true,
                        //   style: TextStyle(
                        //       // fontWeight: FontWeight.w400,
                        //       color: Colors.black87,
                        //       fontSize: 16),
                        // )),
                        // // Spacer(),
                        // const Icon(
                        //   Icons.navigate_next,
                        //   color: Colors.white,
                        // )
                        //     .box
                        //     .roundedFull
                        //     .color(
                        //       icon_colours[index],
                        //     )
                        //     .padding(EdgeInsets.all(3))
                        //     .margin(EdgeInsets.only(left: 5))
                        //     .make(),

                        Expanded(
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: <Widget>[
                              12.widthBox,
                              Container(
                                width: context.width(),
                                height: 80,
                                padding: EdgeInsets.only(left: 16, right: 16),
                                margin: EdgeInsets.only(
                                    right: context.width() / 28),
                                decoration: BoxDecoration(
                                    color: get_color,
                                    borderRadius: BorderRadius.circular(15)),
                                //   boxDecorationDefault(color: cardLightColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Image.asset(
                                      home_widget_images_list[index],
                                      fit: BoxFit.fill,
                                      width: 15,
                                      height: 25,
                                    )
                                        .box
                                        .roundedFull
                                        .white
                                        .padding(EdgeInsets.all(15))
                                        .make(),
                                    10.widthBox,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(subitem.title!.validate(),
                                            style: boldTextStyle(),
                                            maxLines: 2),
                                        Text(
                                          subitem.description.validate(),
                                          style: secondaryTextStyle(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ).visible(subitem.description
                                            .validate()
                                            .isNotEmpty),
                                      ],
                                    ).expand(),
                                    Container(
                                      //height: 25,
                                      margin: EdgeInsets.only(right: 8),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                      decoration:
                                          subitem.tag.validate().isNotEmpty
                                              ? boxDecorationDefault(
                                                  color: appDarkRed)
                                              : BoxDecoration(),
                                      child: Text(subitem.tag.validate(),
                                          style: primaryTextStyle(
                                              color: white, size: 12)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                child: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.black),
                                decoration: boxDecorationDefault(
                                    color: get_color, shape: BoxShape.circle),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    print('pressed  ${subitem.title}');
                    if (subitem.subKit.validate().isNotEmpty) {
                      subKit_screen(subitem, get_color)
                          .launch(context, isNewTask: false);
                    } else {
                      if (subitem.widget != null) {
                        subitem.widget
                            .validate()
                            .launch(context, isNewTask: false);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Coming Soon...',
                            toastLength: Toast.LENGTH_SHORT);
                      }
                    }
                  });
                }),
          ),
        ),
      ),
    );
  }
}
