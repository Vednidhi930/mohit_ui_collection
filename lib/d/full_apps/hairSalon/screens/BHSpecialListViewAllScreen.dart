import 'package:nb_utils/nb_utils.dart';
import '../../../../const/consts.dart';
import '../utils/BHImages.dart';
import '../utils/BHDataProvider.dart';
import '../utils/BHConstants.dart';
import '../utils/BHWidgets.dart';
import '../model/BHModel.dart';

import 'BHDetailScreen.dart';

class BHSpecialListViewAllScreen extends StatefulWidget {
  static String tag = '/SpecialListViewAllScreen';

  final String? specialList;

  BHSpecialListViewAllScreen({this.specialList});

  @override
  BHSpecialListViewAllScreenState createState() =>
      BHSpecialListViewAllScreenState();
}

class BHSpecialListViewAllScreenState
    extends State<BHSpecialListViewAllScreen> {
  late List<BHBestSpecialModel> bestSpecialList;

  @override
  void initState() {
    super.initState();
    bestSpecialList = getSpecialList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.specialList!, style: boldTextStyle(size: 18)),
        centerTitle: true,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        leading: Icon(Icons.arrow_back).onTap(
          () {
            finish(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Wrap(
          runSpacing: 8,
          spacing: 8,
          children: bestSpecialList.map(
            (e) {
              return Container(
                width: context.width() * 0.46 - 16,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cardLightColor,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: commonCacheImageWidget(e.img, 110,
                          width: context.width() * 0.45, fit: BoxFit.cover),
                    ),
                    8.height,
                    Text(e.title!, style: boldTextStyle())
                        .paddingSymmetric(horizontal: 8),
                    8.height,
                    Text(e.subTitle!, style: secondaryTextStyle())
                        .paddingSymmetric(horizontal: 8),
                    8.height,
                  ],
                ),
              ).onTap(
                () {
                  BHDetailScreen().launch(context);
                },
              );
            },
          ).toList(),
        ).center(),
      ),
    );
  }
}
