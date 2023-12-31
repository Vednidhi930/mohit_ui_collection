import 'package:nb_utils/nb_utils.dart';
import '../../../../const/consts.dart';
import '../utils/BHImages.dart';
import '../utils/BHDataProvider.dart';
import '../utils/BHConstants.dart';
import '../utils/BHWidgets.dart';
import '../model/BHModel.dart';
import 'BHVerificationScreen.dart';

class BHForgotPasswordScreen extends StatefulWidget {
  static String tag = '/ForgotPasswordScreen';

  @override
  BHForgotPasswordScreenState createState() => BHForgotPasswordScreenState();
}

class BHForgotPasswordScreenState extends State<BHForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BHColorPrimary,
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  finish(context);
                },
                icon: Icon(Icons.arrow_back, color: whiteColor),
              ),
            ),
            Positioned(
              top: 70,
              child: Container(
                height: context.height(),
                width: context.width(),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  color: cardLightColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(BHTxtForgotPwd, style: boldTextStyle(size: 18)),
                    16.height,
                    Text(BHForgotPasswordSubTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: BHAppTextColorSecondary, fontSize: 14)),
                    8.height,
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        labelText: "Email",
                        labelStyle: secondaryTextStyle(),
                      ),
                    ),
                    24.height,
                    AppButton(
                      text: BHBtnSend,
                      width: context.width(),
                      textStyle: TextStyle(
                          color: whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      color: BHColorPrimary,
                      onTap: () {
                        BHVerificationScreen().launch(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
