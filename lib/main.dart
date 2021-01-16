import 'package:engagment_calculator/config/theme.dart';
import 'package:engagment_calculator/view/ui/splash_screen/splash_screen.dart';
import 'package:engagment_calculator/view/ui/splash_screen/splash_screen_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/ui/home/home.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ThemeApp.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ThemeApp.backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'WorkSans',
        scaffoldBackgroundColor: ThemeApp.backgroundColor,
        accentColor: Colors.pinkAccent,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: ThemeApp.primaryColor,
          ),
        ),
      ),
      color: Colors.white,
      themeMode: ThemeMode.light,
      home: SplashScreenPage(),
    );
  }
}
