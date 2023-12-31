import 'package:nb_utils/nb_utils.dart';
import '../../../../const/consts.dart';
import '../models/MusicModel.dart';
import '../utils/MPColors.dart';
import '../utils/MPDataGenerator.dart';
import '../utils/MPImages.dart';
import '../utils/MPWidget.dart';
import '../component/MPDrawerScreen.dart';
import 'MPNowPlayingScreen.dart';
import 'MPOurChoicesScreen.dart';
import 'MPPopularSongScreen.dart';
import 'MPSearchScreen.dart';
import 'MPSongsScreen.dart';

class MPSongTypeScreen extends StatefulWidget {
  static String tag = '/ MPSongScreen';

  @override
  MPSongTypeScreenState createState() => MPSongTypeScreenState();
}

class MPSongTypeScreenState extends State<MPSongTypeScreen> {
  List<MusicModel> songList = getSongList();

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: songList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2),
              itemBuilder: (BuildContext context, int index) {
                MusicModel data = songList[index];

                return Container(
                  color: data.color,
                  child: Text(data.title!,
                          style: boldTextStyle(color: Colors.white))
                      .center(),
                ).cornerRadiusWithClipRRect(10).onTap(() {
                  MPPopularSongScreen(data: data).launch(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
