import 'package:flutter/material.dart';

import '../../../../main/AppWidget.dart';
import '../../../../const/strings.dart';

import 'package:mohit_ui_collection/d/full_apps/ecommerce/shopping_cart/change_address.dart';
import 'package:mohit_ui_collection/d/full_apps/ecommerce/shopping_cart/delivery.dart';
import 'package:mohit_ui_collection/d/full_apps/ecommerce/shopping_cart/payment.dart';

import '../../../const/colors.dart';
import '../../../library/global_widget.dart';
import '../../../models/apps/ecommerce/category_model.dart';
import '../../../models/apps/ecommerce/coupon_model.dart';
import '../../../models/apps/ecommerce/recomended_product_model.dart';
import '../../../models/apps/ecommerce/shopping_cart_model.dart';
// import '../food_delivery/add_address.dart';
import '../ecommerce/account/set_address/add_address.dart';
import '../ecommerce/home/coupon.dart';
import '../ecommerce/home/coupon_detail.dart';
import '../ecommerce/home.dart';
import '../ecommerce/onboarding.dart';
import '../ecommerce/account/order/order_detail.dart';
import '../ecommerce/account/order/order_status.dart';
import 'account/about.dart';
import 'account/account_information/account_information.dart';
import 'account/account_information/edit_email.dart';
import 'account/account_information/edit_name.dart';
import 'account/account_information/edit_phone_number.dart';
import 'account/last_seen_product.dart';
import 'account/notification_setting.dart';
import 'account/order/order_list.dart';
import 'account/payment_method/add_payment_method.dart';
import 'account/payment_method/edit_payment_method.dart';
import 'account/payment_method/payment_method.dart';
import 'account/privacy_policy.dart';
import 'account/set_address/edit_address.dart';
import 'account/set_address/set_address.dart';
import 'account/terms_conditions.dart';
import 'authentication/forgot_password.dart';
import 'authentication/signin.dart';
import 'authentication/signup.dart';
import 'general/chat_us.dart';
import 'general/notification.dart';
import 'general/product_detail/delivery_estimated.dart';
import 'general/product_detail/product_description.dart';
import 'general/product_detail/product_detail.dart';
import 'general/product_detail/product_review.dart';
import 'home/flashsale.dart';
import 'home/last_search.dart';
import 'home/product_category.dart';
import 'home/search.dart';
import 'home/search_product.dart';
import 'package:mohit_ui_collection/d/full_apps/ecommerce/splash_screen.dart';

class EcommerceListPage extends StatefulWidget {
  @override
  _EcommerceListPageState createState() => _EcommerceListPageState();
}

class _EcommerceListPageState extends State<EcommerceListPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('E-Commerce',
                  style: TextStyle(
                      fontSize: 18,
                      color: BLACK21,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex: 5,
                      child: Container(
                        child: Text(
                            'E-Commerce apps used for online shop services.',
                            style: TextStyle(
                                fontSize: 15,
                                color: BLACK77,
                                letterSpacing: 0.5)),
                      )),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.shopping_cart,
                              size: 50, color: SOFT_BLUE)))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('Screen List',
                  style: TextStyle(
                      fontSize: 18,
                      color: BLACK21,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Splash Screen',
                page: SplashScreenPage()),
            _globalWidget.screenDetailList(
                context: context, title: 'On Boarding', page: OnBoardingPage()),
            _globalWidget.screenDetailList(
                context: context, title: 'Sign In', page: SigninPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sign Up',
                page: SignupPage(
                  fromList: true,
                )),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Forgot Password',
                page: ForgotPasswordPage()),
            _globalWidget.screenDetailList(
                context: context, title: 'Home', page: HomePage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Product Category)',
                page: ProductCategoryPage(
                    categoryId: categoryData[0].id,
                    categoryName: categoryData[0].name)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Search)',
                page: SearchPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Search Product)',
                page: SearchProductPage(words: 'adidas')),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Flash Sale)',
                page: FlashSalePage(seconds: 1800)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Coupon)',
                page: CouponPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Coupon Detail)',
                page: CouponDetailPage(
                    couponData: couponData[0], fromList: true)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Last Search)',
                page: LastSearchPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shopping Cart Tab (Delivery)',
                page: DeliveryPage(shoppingCartData: shoppingCartData)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shopping Cart Tab (Change Address)',
                page: ChangeAddressPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shopping Cart Tab (Payment)',
                page: PaymentPage(fromList: true)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Account Information)',
                page: AccountInformationPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Edit Name)',
                page: EditNamePage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Edit Email)',
                page: EditEmailPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Edit Phone Number)',
                page: EditPhoneNumberPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Set Address for Delivery)',
                page: SetAddressPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Add Address)',
                page: AddAddressPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Edit Address)',
                page: EditAddressPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Order List)',
                page: OrderListPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Order Detail)',
                page: OrderDetailPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Order Status)',
                page: OrderStatusPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Payment Method)',
                page: PaymentMethodPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Add Payment Method)',
                page: AddPaymentMethodPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Edit Payment Method)',
                page: EditPaymentMethodPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Last Seen Product)',
                page: LastSeenProductPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Notification Setting)',
                page: NotificationSettingPage()),
            _globalWidget.screenDetailList(
                context: context, title: 'Account (About)', page: AboutPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Privacy Policy)',
                page: PrivacyPolicyPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Terms and Conditions)',
                page: TermsConditionsPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Chat Us)',
                page: ChatUsPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Notification)',
                page: NotificationPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Product Detail)',
                page: ProductDetailPage(
                    name: recomendedProductData[17].name,
                    image: recomendedProductData[17].image,
                    price: recomendedProductData[17].price,
                    rating: recomendedProductData[17].rating,
                    review: recomendedProductData[17].review,
                    sale: recomendedProductData[17].sale)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Product Description)',
                page: ProductDescriptionPage(
                    name: recomendedProductData[17].name,
                    image: recomendedProductData[17].image)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Delivery Estimated)',
                page: DeliveryEstimatedPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Product Review)',
                page: ProductReviewPage()),
          ],
        ));
  }
}
