import 'package:mohit_ui_collection/const/consts.dart';
import 'package:nb_utils/nb_utils.dart';

class BrokenLinkScreen extends StatefulWidget {
  const BrokenLinkScreen({Key? key}) : super(key: key);

  @override
  _BrokenLinkScreenState createState() => _BrokenLinkScreenState();
}

class _BrokenLinkScreenState extends State<BrokenLinkScreen> {
  // final String giturl =
  //     "https://raw.githubusercontent.com/Mohitjangra1891/mohit_UI_images/main/images/errorScreens/11_Broken_Link.png";

  @override
  void initState() {
    setStatusBarColor(Color(0xFFA0B1C0));
    super.initState();
  }

  //   @override
  // void dispose() {
  //   setStatusBarColor(context.scaffoldBackgroundColor);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          commonCachedNetworkImage(
            "${GlobalUrl}images/errorScreens/11_Broken_Link.png",
            fit: BoxFit.fill,
            height: context.height(),
            width: context.width(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Broken Link! ',
                  style: boldTextStyle(size: 30, color: white)),
              16.height,
              Text(
                'Something went wrong, Please try again later. ',
                style: primaryTextStyle(size: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ).paddingSymmetric(vertical: 8, horizontal: 40),
              32.height,
              AppButton(
                child: Text('RETRY', style: boldTextStyle())
                    .paddingSymmetric(horizontal: 32),
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                elevation: 10,
                padding: EdgeInsets.all(16),
                onTap: () {
                  toast('RETRY');
                },
              ),
              100.height,
            ],
          ),
        ],
      ),
    );
  }
}
