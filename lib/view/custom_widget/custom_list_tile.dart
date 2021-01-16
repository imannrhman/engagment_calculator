import 'package:engagment_calculator/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;
  final Animation animation;
  final AnimationController animationController;
  final VoidCallback onTap;

  const CustomListTile(
      {Key key,
      this.imgUrl,
      this.title,
      this.subtitle,
      this.animation,
      this.animationController,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget widget) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 20 * (1.5 - animation.value), 0.0),
            child: Container(
              height: 72.0,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                child: Stack(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ThemeApp.backgroundColor,
                        backgroundImage: NetworkImage(imgUrl),
                      ),
                      title: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ThemeApp.primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        subtitle,
                        style: TextStyle(
                          color: ThemeApp.primaryColor,
                        ),
                      ),
                    ),
                    Positioned.fill(
                        child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap:onTap,
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
