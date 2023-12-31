import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../utils/ATMList.dart';
import '../utils/Colors.dart';
import '../utils/OPWidgets.dart';
import 'op_atm_location_screen.dart';
import 'op_home_fragment.dart';
import 'op_myCards.dart';
import 'op_profile_screen.dart';
import 'op_transfer_screen.dart';

class OPBottomNavigationScreen extends StatefulWidget {
  @override
  _OPBottomNavigationScreenState createState() =>
      _OPBottomNavigationScreenState();
}

class _OPBottomNavigationScreenState extends State<OPBottomNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tab = [
      OPDasboardScreen(),
      op_myCards(),
      OPDasboardScreen(),
      OPAtmLocationScreen(),
      op_ProfileScreen(),
    ];
    var title = '';

    if (_currentIndex == 0) {
      title = 'Dashboard';
    } else if (_currentIndex == 1) {
      title = 'My card';
    } else if (_currentIndex == 2) {
      title = 'Dashboard';
    } else if (_currentIndex == 3) {
      title = 'ATM Location';
    } else if (_currentIndex == 4) {
      title = 'Profile';
    }

    return SafeArea(
      child: Scaffold(
        appBar: _currentIndex == 0
            ? getAppBar1(
                title,
                actions: [
                  commonCachedNetworkImage(
                          "${GlobalUrl}images/apps/orapay/op_profile.png",
                          width: 30,
                          height: 30)
                      .paddingOnly(right: 16)
                ],
              )
            : getAppBar(
                title,
                pressed: () {
                  setState(
                    () {
                      _currentIndex = 0;
                    },
                  );
                },
              ),
        body: tab[_currentIndex],
        bottomNavigationBar: Stack(
          alignment: Alignment.center,
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              selectedItemColor: opPrimaryColor,
              unselectedItemColor: opSecondaryColor.withOpacity(0.6),
              currentIndex: _currentIndex,
              elevation: 8.0,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 24), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.credit_card, size: 24), label: ''),
                BottomNavigationBarItem(
                    icon: commonCachedNetworkImage(
                      '${GlobalUrl}images/apps/orapay/opsplash.png',
                      width: 36,
                      height: 36,
                      color: Colors.white,
                    ).paddingOnly(bottom: 8.0),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_on, size: 24), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 24), label: ''),
              ],
              onTap: (index) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
            commonCachedNetworkImage(
                    '${GlobalUrl}images/apps/orapay/opsplash.png',
                    width: 36,
                    height: 36)
                .onTap(
              () {
                OPTransferScreen().launch(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
