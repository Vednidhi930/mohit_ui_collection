import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../smart_home/fragments/profile_fragment.dart';
import '../fragments/analytics_dashboard_fragment.dart';
import '../fragments/explore_fragment.dart';
import '../fragments/tools_fragment.dart';
import '../utils/images.dart';
import '../../../../../main/AppWidget.dart';

import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/common.dart';
import 'package:mohit_ui_collection/main/AppStore.dart';

import '../utils/images.dart';

class AnalyticsDashboard extends StatefulWidget {
  static String tag = '/analytics_dashboard';

  final bool isDirect;

  AnalyticsDashboard({this.isDirect = false});

  @override
  _AnalyticsDashboardState createState() => _AnalyticsDashboardState();
}

class _AnalyticsDashboardState extends State<AnalyticsDashboard> {
  int _selectedItemIndex = 0;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    _pages = [
      AnalyticsDashboardFragment(isDirect: widget.isDirect),
      ExploreFragment(),
      ToolsFragment(),
      ProfileFragment(),
    ];
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedItemIndex,
      onTap: _onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      elevation: 20,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedFontSize: 14,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Dashboard', ic_signal),
          activeIcon: customBottomNav(context, true, 'Dashboard', ic_signal),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Explore', ic_explore),
          activeIcon: customBottomNav(context, true, 'Explore', ic_explore),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Tools', ic_tools),
          activeIcon: customBottomNav(context, true, 'Tools', ic_tools),
          label: '',
        ),
        BottomNavigationBarItem(
          icon:
              customBottomNav(context, false, 'Profile', ic_analytics_profile),
          activeIcon:
              customBottomNav(context, true, 'Profile', ic_analytics_profile),
          label: '',
        ),
      ],
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  Widget customBottomNav(
      BuildContext context, bool isActiveIcon, String text, String icon) {
    if (isActiveIcon) {
      return Column(
        children: [
          commonCachedNetworkImage(icon,
              height: 20,
              width: 20,
              color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          8.height,
          Text('$text',
              style: boldTextStyle(
                  size: 14,
                  color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
        ],
      );
    } else {
      return Column(
        children: [
          commonCachedNetworkImage(icon,
              height: 16, width: 16, color: Colors.grey),
          Text('$text', style: primaryTextStyle(color: Colors.grey)),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomTab(),
      body: _pages[_selectedItemIndex],
    );
  }
}
