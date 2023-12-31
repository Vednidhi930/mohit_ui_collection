import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../const/images.dart';

Widget buildCacheNetworkImage(
    {double? width, double? height, url, plColor, imageColor}) {
  if (url.startsWith('http') || url.startsWith('https')) {
    if (width == 0 && height == 0) {
      return CachedNetworkImage(
        placeholder: (context, url) => Image.asset(
          placeholderAsset,
          height: height,
          width: width,
          fit: BoxFit.fill,
        ),
        errorWidget: (context, url, error) {
          print('error loading image from internet w&h =0 $error');

          return Image.asset(
            placeholderAsset,
            height: height,
            width: width,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          );
        },
        imageUrl: url,
        fit: BoxFit.cover,
        color: imageColor == null ? null : imageColor,
      );
    } else if (height == 0) {
      return CachedNetworkImage(
        placeholder: (context, url) => Image.asset(
          placeholderAsset,
          height: height,
          width: width,
          fit: BoxFit.fill,
        ),
        errorWidget: (context, url, error) {
          print('error loading image from internet h==0 , $error');

          return Image.asset(
            placeholderAsset,
            height: height,
            width: width,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          );
        },
        imageUrl: url,
        fit: BoxFit.cover,
        width: width,
        color: imageColor == null ? null : imageColor,
      );
    } else {
      return CachedNetworkImage(
        placeholder: (context, url) => Image.asset(
          placeholderAsset,
          height: height,
          width: width,
          fit: BoxFit.fill,
        ),
        errorWidget: (context, url, error) {
          print('error loading image from internet == $error');

          return Image.asset(
            placeholderAsset,
            height: height,
            width: width,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          );
        },
        imageUrl: url.toString(),
        fit: BoxFit.cover,
        width: width,
        height: height,
        color: imageColor == null ? null : imageColor,
      );
    }
  } else {
    if (width == 0 && height == 0) {
      return Image.asset(
        url,
        fit: BoxFit.cover,
        color: imageColor == null ? null : imageColor,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          print('error loading asset in buildCacheNetworkImage');
          // Handle asset loading error
          return Image.asset(
            placeholderAsset,
            height: height,
            width: width,
            fit: BoxFit.cover,
          );
        },
      );
    } else if (height == 0) {
      return Image.asset(
        url,
        fit: BoxFit.cover,
        width: width,
        color: imageColor == null ? null : imageColor,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          print('error loading asset in buildCacheNetworkImage');
          // Handle asset loading error
          return Image.asset(
            placeholderAsset,
            height: height,
            width: width,
            fit: BoxFit.cover,
          );
        },
      );
    } else {
      return Image.asset(
        url,
        fit: BoxFit.cover,
        width: width,
        height: height,
        color: imageColor == null ? null : imageColor,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          print('error loading asset in buildCacheNetworkImage');
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
}
