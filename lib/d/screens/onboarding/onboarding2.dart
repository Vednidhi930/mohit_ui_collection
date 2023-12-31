import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'dart:io' as IO;
import '../../../const/strings.dart';
import '../../../main/AppWidget.dart';
import '../../../library/flutter_overboard/cache_image_network.dart';

class SkOnboardingModel {
  String title;
  String description;
  Color titleColor;
  Color descripColor;
  String? imageAssetPath;
  String? imageFromUrl;

  SkOnboardingModel({
    required this.title,
    required this.description,
    this.imageAssetPath,
    this.imageFromUrl,
    required this.titleColor,
    required this.descripColor,
  });
}

class Onboarding2Page extends StatefulWidget {
  @override
  _Onboarding2PageState createState() => _Onboarding2PageState();
}

class _Onboarding2PageState extends State<Onboarding2Page> {
  final pages = [
    SkOnboardingModel(
        title: 'Tutorial 1',
        description:
            'This is description of tutorial 1. Lorem ipsum dolor sit amet.',
        titleColor: Colors.black,
        descripColor: Color(0xFF929794),
        imageAssetPath: '${GlobalUrl}images/lamp.jpg'),
    SkOnboardingModel(
        title: 'Tutorial 2',
        description:
            'This is description of tutorial 2. Lorem ipsum dolor sit amet.',
        titleColor: Colors.black,
        descripColor: Color(0xFF929794),
        imageFromUrl: '${GlobalUrl}images/onboarding/cart.png'),
    SkOnboardingModel(
        title: 'Tutorial 3',
        description:
            'This is description of tutorial 3. Lorem ipsum dolor sit amet.',
        titleColor: Colors.black,
        descripColor: Color(0xFF929794),
        imageFromUrl: '${GlobalUrl}images/onboarding/delivery.png'),
  ];

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
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          Fluttertoast.showToast(
              msg: 'Click skip', toastLength: Toast.LENGTH_SHORT);
        },
        getStartedClicked: (value) {
          Fluttertoast.showToast(
              msg: 'Click get started', toastLength: Toast.LENGTH_SHORT);
        },
      ),
    ));
  }
}

class SKOnboardingScreen extends StatefulWidget {
  final List<SkOnboardingModel> pages;
  final Color bgColor;
  final Color themeColor;
  final ValueChanged<String> skipClicked;
  final ValueChanged<String> getStartedClicked;

  SKOnboardingScreen({
    Key? key,
    required this.pages,
    required this.bgColor,
    required this.themeColor,
    required this.skipClicked,
    required this.getStartedClicked,
  }) : super(key: key);

  @override
  SKOnboardingScreenState createState() => SKOnboardingScreenState();
}

class SKOnboardingScreenState extends State<SKOnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.pages.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> buildOnboardingPages() {
    final children = <Widget>[];

    for (int i = 0; i < widget.pages.length; i++) {
      children.add(_showPageData(widget.pages[i]));
    }
    return children;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? widget.themeColor : Color(0xFF929794),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.width / 0.8;
    // if (!IO.Platform.isIOS && !IO.Platform.isAndroid) {
    //   pageHeight = MediaQuery.of(context).size.height / 1.3;
    // }
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        widget.skipClicked("Skip Tapped");
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      )),
                ),
                Container(
                  height: pageHeight,
                  color: Colors.transparent,
                  child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: buildOnboardingPages()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != widget.pages.length - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20, bottom: 10),
                            child: FloatingActionButton(
                              backgroundColor: widget.bgColor,
                              child: Icon(
                                Icons.arrow_forward,
                                color: widget.themeColor,
                              ),
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == widget.pages.length - 1
          ? _showGetStartedButton()
          : Text(''),
    );
  }

  Widget _showPageData(SkOnboardingModel page) {
    double size = MediaQuery.of(context).size.width / 1.5;
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: (page.imageAssetPath != null)
                  ? commonCachedNetworkImage(page.imageAssetPath!,
                      width: size, height: size)
                  : buildCacheNetworkImage(
                      width: size,
                      height: size,
                      url: page.imageFromUrl,
                      plColor: Colors.transparent),
            ),
            SizedBox(height: 30.0),
            Text(
              page.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: page.titleColor,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              page.description,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: page.descripColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showGetStartedButton() {
    final GestureDetector loginButtonWithGesture = new GestureDetector(
      onTap: _getStartedTapped,
      child: new Container(
        height: 50.0,
        decoration: new BoxDecoration(
            color: widget.themeColor,
            borderRadius: new BorderRadius.all(Radius.circular(6.0))),
        child: new Center(
          child: new Text(
            'Get Started',
            style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );

    return new Padding(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 30.0),
        child: loginButtonWithGesture);
  }

  void _getStartedTapped() {
    widget.getStartedClicked("Get Started Tapped");
  }
}
