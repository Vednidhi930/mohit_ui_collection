import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'const/consts.dart';
import 'homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialize();
  //
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor:
  //       Colors.transparent, // Set your desired status bar color here
  //   statusBarBrightness:
  //       Brightness.light, // Change the status bar brightness if needed
  // ));
  runApp(MyApp());
  setOrientationPortrait();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.openSans().fontFamily,
        hintColor: appPrimaryColor,
        indicatorColor: appPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        //

        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          iconTheme: IconThemeData(color: textColorPrimary),
        ),
        //
        dialogBackgroundColor: Colors.white,
        dialogTheme: DialogTheme(backgroundColor: Colors.white),

        //

        cardTheme: CardTheme(color: Colors.white),
        cardColor: cardLightColor,
        //

        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.white),
        //
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
        //
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const homePage(),
    );
  }
}
