import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../const/strings.dart';
import '../../../main/AppWidget.dart';

class NoConnectionScreen extends StatefulWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  _NoConnectionScreenState createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFEFF1F3));
    super.initState();
  }

  //   @override
  // void dispose() {
  //   setStatusBarColor(context.scaffoldBackgroundColor);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            commonCachedNetworkImage(
                '${GlobalUrl}images/errorScreens/10_Connection_Lost.png',
                fit: BoxFit.cover,
                height: context.height()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('No Connection', style: boldTextStyle(size: 30)),
                32.height,
                Text(
                  'Your internet connection was interrupted, Please retry.',
                  style: primaryTextStyle(color: Colors.blueGrey, size: 18),
                ),
                48.height,
                AppButton(
                  child: Text('RETRY', style: boldTextStyle(color: white)),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 10,
                  color: Color(0xFF40588B),
                  onTap: () {
                    toast('RETRY');
                  },
                ),
                20.height,
              ],
            ).paddingAll(32),
          ],
        ),
      ),
    );
  }
}
