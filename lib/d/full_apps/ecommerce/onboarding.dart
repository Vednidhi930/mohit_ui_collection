//import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/consts.dart';
import '../../../library/flutter_overboard/overboard.dart';
import '../../../library/flutter_overboard/page_model.dart';
import 'authentication/signin.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  // create each page of onBoard here
  final _pageList = [
    PageModel(
        color: Colors.white,
        imageAssetPath:
            '${GlobalUrl}images/apps/ecommerce/onboarding/search_product.gif',
        title: 'Choose Product',
        body: 'Search and browse the product you want to buy at iJShop',
        doAnimateImage: true),
    PageModel(
        color: Colors.white,
        imageFromUrl: '${GlobalUrl}images/apps/ecommerce/onboarding/cart.png',
        title: 'Add to Cart and Pay',
        body:
            'Add the product to shopping cart, choose delivery and then pay with your preferences payment',
        doAnimateImage: true),
    PageModel(
        color: Colors.white,
        imageFromUrl:
            '${GlobalUrl}images/apps/ecommerce/onboarding/delivery.png',
        title: 'Delivery',
        body:
            'Wait until the product that has been purchased comes to the house',
        doAnimateImage: true),
  ];

  @override
  void initState() {
    super.initState();
  }

  // this function used if user click finish, you won't see this page again until you clear your data of this apps in your phone setting
  /*void _finishOnBoarding() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.setBool('onBoarding', false);
  }*/

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OverBoard(
      pages: _pageList,
      showBullets: true,
      finishCallback: () {
        //_finishOnBoarding();

        // after you click finish, direct to signin page
        // Adjust with your need using push replacement or push remove until
        //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SigninPage()), (Route<dynamic> route) => false);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SigninPage()));
      },
    ));
  }
}
