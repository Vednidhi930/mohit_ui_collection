import 'package:nb_utils/nb_utils.dart';
import '../../../../const/consts.dart';
import '../models/MusicModel.dart';
import '../utils/MPColors.dart';
import '../utils/MPDataGenerator.dart';
import '../utils/MPImages.dart';
import '../utils/MPWidget.dart';
import 'package:mohit_ui_collection/main/utils/Lipsum.dart' as lipsum;

import 'MPSearchScreen.dart';

class MPNewsDetailScreen extends StatefulWidget {
  @override
  MPNewsDetailScreenState createState() => MPNewsDetailScreenState();
}

class MPNewsDetailScreenState extends State<MPNewsDetailScreen> {
  bool _alreadySaved = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mpAppBackGroundColor,
      appBar: AppBar(
        backgroundColor: mpAppBackGroundColor,
        title: Text('News Detail',
            style: boldTextStyle(color: white.withOpacity(0.9), size: 18)),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: white.withOpacity(0.9)),
        actions: [
          searchIconWidget(onPressed: () {
            MPSearchScreen().launch(context);
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonCacheImageWidget(mpImages_11, 240,
                width: context.width(), fit: BoxFit.cover),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lipsum.createWord(numWords: 4),
                        style: boldTextStyle(color: white.withOpacity(0.9))),
                    Icon(
                      _alreadySaved
                          ? Icons.favorite_border
                          : Icons.favorite_border,
                      color: _alreadySaved
                          ? mpAppButtonColor.withOpacity(0.5)
                          : mpAppButtonColor,
                    ).onTap(() {
                      setState(() {
                        _alreadySaved = !_alreadySaved;
                      });
                    }),
                  ],
                ),
                16.height,
                Text(lipsum.createParagraph(numParagraphs: 1),
                    style:
                        secondaryTextStyle(color: mpAppTextColor1, size: 14)),
                16.height,
                Text(lipsum.createParagraph(numParagraphs: 1),
                    style:
                        secondaryTextStyle(color: mpAppTextColor1, size: 14)),
                16.height,
                Text(lipsum.createParagraph(numParagraphs: 1),
                    style:
                        secondaryTextStyle(color: mpAppTextColor1, size: 14)),
              ],
            ).paddingAll(16),
          ],
        ),
      ),
      bottomNavigationBar:
          Container(height: 70, child: playMusicWidget(context)),
    );
  }
}
