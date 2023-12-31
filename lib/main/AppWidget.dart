import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:mohit_ui_collection/const/consts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppConstant.dart';

Widget text(
  String? text, {
  var fontSize = textSizeLargeMedium,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    softWrap: true,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}
//
// Future<List<LatLngAndGeohash>> getListOfLatLngAndGeoHash(BuildContext context) async {
//   try {
//     final fakeList = await (loadDataFromJson(context));
//     List<LatLngAndGeohash> myPoints = [];
//     for (int i = 0; i < fakeList!.length; i++) {
//       //TODO Without NullSafety Geo coder
//       //final fakePoint = fakeList[i];
//       final p = LatLngAndGeohash(
//           //TODO Without NullSafety Geo coder
//           // LatLng(fakePoint["LATITUDE"], fakePoint["LONGITUDE"]),
//           );
//       myPoints.add(p);
//     }
//     return myPoints;
//   } catch (e) {
//     throw Exception(e.toString());
//   }
// }

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}

BoxDecoration gradientBoxDecoration(
    {double radius = 10,
    Color color = Colors.transparent,
    Color gradientColor2 = Colors.white,
    Color gradientColor1 = Colors.white,
    var showShadow = false}) {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [gradientColor1, gradientColor2]),
    boxShadow: showShadow
        ? [BoxShadow(color: ShadowColor, blurRadius: 10, spreadRadius: 2)]
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Widget settingItem(context, String text,
    {Function? onTap,
    Widget? detail,
    Widget? leading,
    Color? textColor,
    int? textSize,
    double? padding}) {
  return InkWell(
    onTap: onTap as void Function()?,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: padding ?? 8, bottom: padding ?? 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  child: leading ?? SizedBox(),
                  width: 30,
                  alignment: Alignment.center),
              leading != null ? 10.width : SizedBox(),
              Text(text,
                      style: primaryTextStyle(
                          size: textSize ?? 18,
                          color: textColor ?? textPrimaryColor))
                  .expand(),
            ],
          ).expand(),
          detail ??
              Icon(Icons.arrow_forward_ios,
                  size: 16, color: textSecondaryColor),
        ],
      ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
    ),
  );
}

Widget appBarTitleWidget(context, String title,
    {Color? color, Color? textColor, int? textSize}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: boldTextStyle(
              color: color ?? textPrimaryColor, size: textSize ?? 18),
          maxLines: 1,
        ).expand(),
      ],
    ),
  );
}

AppBar appBar(BuildContext context, String title,
    {final bool isDashboard = false,
    List<Widget>? actions,
    bool showBack = true,
    Color? color,
    Color? iconColor,
    Color? textColor,
    int? textSize,
    double? elevation}) {
  // return AppBar(
  //   // automaticallyImplyLeading: false,
  //   backgroundColor: color ?? appBarBackgroundColorGlobal,
  //   iconTheme: IconThemeData(
  //     color: Colors.black, //change your color here
  //   ),
  //   systemOverlayStyle: SystemUiOverlayStyle.dark,
  //   leading: showBack
  //       ? IconButton(
  //           onPressed: () {
  //             finish(context);
  //           },
  //           icon: Icon(Icons.arrow_back, color: black),
  //         )
  //       : null,
  //   title: appBarTitleWidget(
  //     context,
  //     title,
  //     textColor: textColor ?? Colors.black,
  //   ),
  //   actions: actions,
  //   elevation: elevation ?? 0.2,
  // );
  return AppBar(
    automaticallyImplyLeading: false,
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    leading: showBack
        ? IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.arrow_back, color: iconColorPrimaryDark),
          )
        : null,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(fontSize: 18, color: Colors.black),
    ),
    backgroundColor: appBarBackgroundColorGlobal,
    actions: actions,
    bottom: PreferredSize(
        child: Container(
          color: Colors.grey[100],
          height: 1.0,
        ),
        preferredSize: Size.fromHeight(1.0)),
  );
}
//
// class ExampleItemWidget extends StatelessWidget {
//   final ListModel tabBarType;
//   final Function onTap;
//   final bool showTrailing;
//
//   ExampleItemWidget(this.tabBarType, {required this.onTap, this.showTrailing = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: appStore.appBarColor,
//       margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
//       elevation: 2.0,
//       shadowColor: Colors.black,
//       child: ListTile(
//         onTap: () => onTap(),
//         title: Text(tabBarType.name!, style: boldTextStyle()),
//         trailing: showTrailing
//             ? Icon(Icons.arrow_forward_ios, size: 15, color: appStore.textPrimaryColor)
//             : tabBarType.isNew.validate()
//                 ? Text('New', style: secondaryTextStyle(color: Colors.red))
//                 : null,
//       ),
//     );
//   }
// }
//
// String convertDate(date) {
//   try {
//     return date != null ? DateFormat(dateFormat).format(DateTime.parse(date)) : '';
//   } catch (e) {
//     print(e);
//     return '';
//   }
// }

class CustomTheme extends StatelessWidget {
  final Widget? child;

  CustomTheme({required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: child!,
    );
  }
}

Widget? Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeholderWidget();

Widget placeholderWidget() =>
    Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover);

BoxConstraints dynamicBoxConstraints({double? maxWidth}) {
  return BoxConstraints(maxWidth: maxWidth ?? applicationMaxWidth);
}

double dynamicWidth(BuildContext context) {
  return isMobile ? context.width() : applicationMaxWidth;
}

/*class ContainerX extends StatelessWidget {
  static String tag = '/ContainerX';
  final BuildContext context;
  final double maxWidth;
  final Widget child;

  ContainerX({@required this.context, this.maxWidth, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height(),
      child: ConstrainedBox(
        constraints: dynamicBoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
      alignment: Alignment.topCenter,
    );
  }
}*/
//
// String? getBannerAdUnitId() {
//   if (kReleaseMode) {
//     if (Platform.isIOS) {
//       return bannerAdIdForIos;
//     } else if (Platform.isAndroid) {
//       return bannerAdIdForAndroidRelease;
//     }
//   } else {
//     if (Platform.isIOS) {
//       return bannerAdIdForIos;
//     } else if (Platform.isAndroid) {
//       return bannerAdIdForAndroid;
//     }
//   }
//   return null;
// }
//
// String getInterstitialAdUnitId() {
//   if (kReleaseMode) {
//     if (Platform.isIOS) {
//       return interstitialAdIdForIos;
//     } else if (Platform.isAndroid) {
//       return InterstitialAdIdForAndroidRelease;
//     }
//   } else {
//     if (Platform.isIOS) {
//       return interstitialAdIdForIos;
//     } else if (Platform.isAndroid) {
//       return InterstitialAdIdForAndroid;
//     }
//   }
//
//   return InterstitialAdIdForAndroid;
// }
//
// String parseHtmlString(String? htmlString) {
//   return parse(parse(htmlString).body!.text).documentElement!.text;
// }

class ContainerX extends StatelessWidget {
  final Widget? mobile;
  final Widget? web;
  final bool? useFullWidth;

  ContainerX({this.mobile, this.web, this.useFullWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.device == DeviceSize.mobile) {
          return mobile ?? SizedBox();
        } else {
          return Container(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: useFullWidth.validate()
                  ? null
                  : BoxConstraints(maxWidth: context.width() * 0.9),
              child: web ?? SizedBox(),
            ),
          );
        }
      },
    );
  }
}

Widget commonCacheImageWidget(String? url, double? height,
    {double? width, BoxFit? fit}) {
  if (url != null && Uri.parse(url).isAbsolute) {
    if (isMobile) {
      return CachedNetworkImage(
        imageUrl: url,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) => Image.asset(
          placeholderAsset,
          height: height,
          width: width,
          fit: BoxFit.fill,
        ),
        errorWidget: (context, url, error) {
          print('error loading image from internet');
          return Image.asset(
            placeholderAsset,
            height: height,
            width: width,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          );
        },
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
      );
    }
  } else {
    return Image.asset(
      url!,
      height: height,
      width: width,
      fit: fit ?? BoxFit.fill,
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        print('error loading asset in commonCacheImageWidget from assets');
        // Handle asset loading error
        return Image.asset(
          placeholderAsset,
          height: height,
          width: width,
          fit: BoxFit.cover,
        );
      },
    );
  }
}

//
// Widget commonCacheImageWidget(String? url, double? height,
//     {double? width, BoxFit? fit}) {
//   if (url.validate().startsWith('http') || url.validate().startsWith('https')) {
//     if (isMobile) {
//       return CachedNetworkImage(
//         imageUrl: '$url',
//         height: height,
//         width: width,
//         fit: fit ?? BoxFit.cover,
//         placeholder: (context, url) => Image.asset(
//           placeholderAsset,
//           height: height,
//           width: width,
//           fit: BoxFit.fill,
//         ),
//         errorWidget: (context, url, error) {
//           print('error loading image from internet');
//
//           return Image.asset(
//             placeholderAsset,
//             height: height,
//             width: width,
//             fit: BoxFit.fill,
//             alignment: Alignment.center,
//           );
//         },
//       );
//     } else {
//       return Image.network(url!,
//           height: height, width: width, fit: fit ?? BoxFit.cover);
//     }
//   } else {
//     return Image.asset(
//       url!,
//       height: height,
//       width: width,
//       fit: fit ?? BoxFit.fill,
//       errorBuilder:
//           (BuildContext context, Object error, StackTrace? stackTrace) {
//         print('error loading asset in commonCacheImageWidget from assets');
//         // Handle asset loading error
//         return Image.asset(
//           placeholderAsset,
//           height: height,
//           width: width,
//           fit: BoxFit.cover,
//         );
//       },
//     );
//   }
// }

//load image

Widget commonCachedNetworkImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
  Color? color,
}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      placeholder: (context, url) => Image.asset(
        placeholderAsset,
        height: height,
        width: width,
        fit: fit ?? BoxFit.fill,
      ),
      errorWidget: (context, url, error) {
        print('error loading image from internet = $error');

        return Image.asset(
          placeholderAsset,
          height: height,
          width: width,
          fit: fit ?? BoxFit.fill,
          alignment: alignment ?? Alignment.center,
        ).cornerRadiusWithClipRRect(radius ?? defaultRadius);
      },
    );
  } else {
    return Image.asset(
      url,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment ?? Alignment.center,
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        print('error loading asset');
        // Handle asset loading error
        return Image.asset(
          placeholderAsset,
          height: height,
          width: width,
          fit: fit ?? BoxFit.fill,
          alignment: alignment ?? Alignment.center,
        ).cornerRadiusWithClipRRect(radius ?? defaultRadius);
      },
    ).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius}) {
  return Image.asset('assets/images/placeholder.jpg',
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
