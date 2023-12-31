import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/main/AppStore.dart';

import '../../../../const/consts.dart';
import '../../../../main/AppWidget.dart';
import '../model/T3_Model.dart';
import '../utils/T3BottomNavigationBar.dart';
import '../utils/T3DataGenerator.dart';
import '../utils/T3Images.dart';
import '../utils/T3widgets.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import 'T3Dashboard.dart';
import 'T3Listing.dart';

class T3Tab extends StatefulWidget {
  static String tag = '/T3Tab';

  @override
  T3TabState createState() => T3TabState();
}

class T3TabState extends State<T3Tab> {
  double lowerValue = 50;
  double upperValue = 180;
  double value = 0.0;
  RangeValues currentRangeValues = const RangeValues(20, 60);

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return SafeArea(
      child: Observer(
        builder: (_) => DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: AppBar(
                backgroundColor: appStore.appBarColor,
                flexibleSpace: Align(
                  alignment: Alignment.bottomCenter,
                  child: TabBar(
                    labelColor: t3_colorPrimary,
                    indicatorColor: t3_colorPrimary,
                    unselectedLabelColor: appStore.textPrimaryColor,
                    tabs: [
                      Tab(text: "Chef"),
                      Tab(text: "Price"),
                      Tab(text: "Dietary"),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Center(child: ChefCheckboxWidget()),
                RangeSlider(
                  activeColor: Colors.redAccent,
                  values: currentRangeValues,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  labels: RangeLabels(
                    currentRangeValues.start.round().toString(),
                    currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      currentRangeValues = values;
                    });
                  },
                ),
                Center(child: CheckboxWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetState createState() => CheckboxWidgetState();
}

class CheckboxWidgetState extends State {
  var a = "";
  Map<String, bool?> values = {
    'Vegetrain': false,
    'Vegan': false,
    'Non-Vegetrain': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: context.scaffoldBackgroundColor,
              blurRadius: 2,
              spreadRadius: 1)
        ],
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0)),
      ),
      child: Column(children: <Widget>[
        Expanded(
          child: ListView(
            children: values.keys.map((String key) {
              return CustomTheme(
                child: CheckboxListTile(
                  title: Text(key, style: primaryTextStyle()),
                  value: values[key],
                  activeColor: t3_colorPrimary,
                  checkColor: Colors.white,
                  onChanged: (bool? value) {
                    setState(() {
                      values[key] = value;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: T3AppButton(
              textContent: t3_lbl_done,
              onPressed: () {},
            ))
      ]),
    );
  }
}

class ChefCheckboxWidget extends StatefulWidget {
  @override
  ChefCheckboxWidgetState createState() => ChefCheckboxWidgetState();
}

class ChefCheckboxWidgetState extends State {
  var a = "";
  Map<String, bool?> values = {
    'John Smith': false,
    'Lee': false,
    'Alexender Cinah': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: context.scaffoldBackgroundColor,
              blurRadius: 2,
              spreadRadius: 1),
        ],
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0)),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: values.keys.map((String key) {
                return CustomTheme(
                  child: CheckboxListTile(
                    title: Text(key),
                    value: values[key],
                    activeColor: t3_colorPrimary,
                    checkColor: Colors.white,
                    onChanged: (bool? value) {
                      values[key] = value;
                      setState(() {});
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: T3AppButton(
              textContent: t3_lbl_done,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
