import 'package:flutter/material.dart';
import 'package:mohit_ui_collection/library/flutter_overboard/cache_image_network.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../model/T11Model.dart';
import '../utils/T11DataGenerator.dart';
import '../utils/T11Images.dart';
import '../utils/T11Strings.dart';
import '../utils/T11Widget.dart';

class T11DescriptionScreen extends StatefulWidget {
  static String tag = '/T11DescriptionScreen';

  @override
  T11DescriptionScreenState createState() => T11DescriptionScreenState();
}

class T11DescriptionScreenState extends State<T11DescriptionScreen> {
  late List<Music> musicList;

  @override
  void initState() {
    super.initState();
    setStatusBarColor(Colors.transparent);
    musicList = generateAlbumMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                buildCacheNetworkImage(
                    url: t11_ic_singer5, height: 500, width: context.width()),
                Container(
                  alignment: Alignment.topCenter,
                  height: 500,
                  decoration: gradientBoxDecoration(
                    gradientColor1: Colors.transparent,
                    gradientColor2: Colors.white,
                    radius: 0,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 16,
                  right: 16,
                  child: Text(
                    t11_lbl_sample_long,
                    style: secondaryTextStyle(color: black),
                    maxLines: 10,
                  ),
                )
              ],
            ),
            16.height,
            Text('Similar Artist', style: boldTextStyle(size: 18))
                .paddingLeft(16),
            16.height,
            musicSimilarArtistList(musicList),
            musicSimilarArtistList(musicList),
          ],
        ),
      ),
    );
  }
}
