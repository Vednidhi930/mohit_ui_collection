import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/main/AppStore.dart';

import '../utils/colors.dart';
import '../utils/constant.dart';

class PageDropDownComponent extends StatefulWidget {
  @override
  State<PageDropDownComponent> createState() => _PageDropDownComponentState();
}

class _PageDropDownComponentState extends State<PageDropDownComponent> {
  String pageName = 'quint.com';

  List<String> pageItem = ['quint.com', 'service.com', 'trade.com'];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text('Select Gender'),
      value: pageName,
      isExpanded: true,
      iconSize: 0,
      decoration: InputDecoration(
        border:
            OutlineInputBorder(borderRadius: radius(DEFAULT_ANALYTICS_RADIUS)),
        prefixIcon: Icon(Icons.web,
            color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        suffixIcon: Icon(Icons.keyboard_arrow_down,
            color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        suffixIconConstraints: BoxConstraints.tightFor(height: 50),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: dropDownBorderColor),
          borderRadius: radius(DEFAULT_ANALYTICS_RADIUS),
        ),
        contentPadding: EdgeInsets.zero,
      ),
      onChanged: (String? value) {
        pageName = value!;
        setState(() {});
      },
      items: pageItem.map((itemValue) {
        return DropdownMenuItem(
            child: Text(itemValue, style: primaryTextStyle()),
            value: itemValue);
      }).toList(),
    );
  }
}
