import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main/AppWidget.dart';
import '../../theme1/utils/T1Constant.dart';
import '../utils/T1Colors.dart';
import '../utils/T1DataGenerator.dart';
import '../utils/T1Images.dart';
import '../utils/T1Strings.dart';
import '../utils/T1Widget.dart';
import 'T1Listing.dart';
import 'T1Profile.dart';

class T1Login extends StatefulWidget {
  static var tag = "/T1SignIn";

  @override
  _T1LoginState createState() => _T1LoginState();
}

class _T1LoginState extends State<T1Login> {
  bool? rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Observer(
            builder: (_) => Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
                  commonCachedNetworkImage(t1_ic_ring, height: 100, width: 100),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      formHeading(t1_lbl_sign_in_header),
                      formSubHeadingForm(t1_lbl_sign_up),
                    ],
                  ),
                  SizedBox(height: 50),
                  editTextStyle(t1_user_name, isPassword: false),
                  SizedBox(height: 16),
                  editTextStyle(t1_hint_password, isPassword: true),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: CustomTheme(
                      child: CheckboxListTile(
                        title: text(t1_lbl_remember,
                            textColor: textSecondaryColor),
                        value: rememberMe,
                        onChanged: (newValue) {
                          rememberMe = newValue;
                          setState(() {});
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                      padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
                      child: shadowButton(t1_lbl_sign_in)),
                  SizedBox(height: 24),
                  text(t1_lbl_forgot_password,
                      textColor: textPrimaryColor, fontFamily: fontMedium)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
