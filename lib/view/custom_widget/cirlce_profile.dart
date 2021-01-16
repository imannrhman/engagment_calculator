

import 'package:engagment_calculator/config/theme.dart';
import 'package:flutter/material.dart';

class CircleProfile extends StatelessWidget{
 final double width;
 final double height;
 final String imgSource;

  const CircleProfile({Key key, this.width, this.height, this.imgSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:height,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ThemeApp.semiWhite,
        gradient: ThemeApp.gradientInstagram,
      ),
      child: ClipOval(
        clipBehavior: Clip.antiAlias,
        child: Container(
          child: Image.network(
            imgSource,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

}