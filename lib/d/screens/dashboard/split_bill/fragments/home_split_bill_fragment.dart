import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../const/consts.dart';
import '../../health_medical/screens/health_medical_dashboard.dart';
import '../component/nearby_split_component.dart';
import '../component/split_with_component.dart';
import '../model/split_bill_info_model.dart';
import '../utils/colors.dart';
import 'package:mohit_ui_collection/main/AppStore.dart';

import '../utils/common.dart';
import '../utils/constant.dart';
import '../utils/images.dart';

class HomeSplitBillFragment extends StatefulWidget {
  final bool isDirect;

  HomeSplitBillFragment({this.isDirect = false});

  @override
  _HomeSplitBillFragmentState createState() => _HomeSplitBillFragmentState();
}

class _HomeSplitBillFragmentState extends State<HomeSplitBillFragment> {
  List<SplitBillInfoModel> splitModelInfo = getSplitWithList();
  List<SplitBillInfoModel> splitNearbyFriendsInfo = getNearbyFriendsList();
  List<SplitBillInfoModel> recentSplitIconInfo = getRecentSplitIconList();
  List<SplitBillInfoModel> recentSplitInfo = getRecentSplitList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: appStore.isDarkModeOn
                  ? primarySplitBillLinearGradient()
                  : primarySplitBillLightGradient()),
          child: SafeArea(
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          finish(context);
                        },
                        visualDensity: VisualDensity.compact,
                        icon: Icon(Icons.arrow_back),
                      ),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi,Tushaar',
                              style: primaryTextStyle(color: Colors.white)),
                          6.height,
                          Text('Splitter Your Bill',
                              style:
                                  boldTextStyle(size: 18, color: Colors.white)),
                        ],
                      ).expand(),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn
                              ? containerColor
                              : Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: radius(10),
                        ),
                        child: commonCachedNetworkImage(ic_man,
                            height: 24, width: 24),
                      ),
                    ],
                  ),
                  30.height,
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn
                          ? containerColor
                          : cardLightColor,
                      shape: BoxShape.rectangle,
                      borderRadius: radius(DEFAULT_RADIUS),
                    ),
                    child: SplitWithComponent(splitModelInfo: splitModelInfo),
                  ),
                  30.height,
                  Container(
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn
                          ? containerColor
                          : cardLightColor,
                      shape: BoxShape.rectangle,
                      borderRadius: radius(10),
                    ),
                    child: NearbySplitComponent(
                      splitNearbyFriendsInfo: splitNearbyFriendsInfo,
                      recentSplitIconInfo: recentSplitIconInfo,
                      recentSplitInfo: recentSplitInfo,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
