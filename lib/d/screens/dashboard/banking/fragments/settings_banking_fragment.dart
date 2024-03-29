import 'package:flutter/material.dart';

import 'home_banking_fragment.dart';

class SettingsBankingFragment extends StatefulWidget {
  @override
  _SettingsBankingFragmentState createState() =>
      _SettingsBankingFragmentState();
}

class _SettingsBankingFragmentState extends State<SettingsBankingFragment> {
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
    return Scaffold(
      body: HomeBankingFragment(),
    );
  }
}
