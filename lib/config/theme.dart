import 'package:flutter/material.dart';

class ThemeApp {
  static Color backgroundColor = Color(0xFFF1F3F6);
  static Color semiWhite = Color.fromRGBO(255, 255, 255, 0.5);
  static Color primaryColor = Color(0xFF5F7495);
  static Color secondaryColor = Color(0xFFA3B1C6);
  static Color mainBlack  = Color(0xFF343433);
  static LinearGradient gradientNeumorphism = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Colors.white,
      Colors.white70,
      Colors.white30,
      Colors.white10,
    ],
    stops: [
      0.1,
      0.3,
      0.8,
      1,
    ],
  );

  static LinearGradient gradientInstagram = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFEDA75),
      Color(0xFFFA7E1E),
      Color(0xFFD62976),
      Color(0xFF962FBF),
      Color(0xFF4F5BD5),
    ],
  );
  static List<BoxShadow> neumorphismShadow = [
    BoxShadow(
      blurRadius: 300.0,
      offset: Offset(20.0, 20.0),
      color: Color.fromRGBO(55, 84, 170, 0.15),
    ),
    BoxShadow(
      blurRadius: 80.0,
      offset: Offset(-20.0, -30.0),
      color: Colors.white,
    ),
    BoxShadow(
      blurRadius: 20.0,
      offset: Offset(4.0, 4.0),
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
  ];
  static List<BoxShadow> neumorphismShadowSmall = [
    BoxShadow(
      blurRadius: 40.0,
      offset: Offset(15.0, 15.0),
      color: Color.fromRGBO(55, 84, 170, 0.15),
    ),
    BoxShadow(
      blurRadius: 80.0,
      offset: Offset(-15.0, -15.0),
      color: Colors.white,
    ),
    BoxShadow(
      blurRadius: 20.0,
      offset: Offset(4.0, 4.0),
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
  ];
}
