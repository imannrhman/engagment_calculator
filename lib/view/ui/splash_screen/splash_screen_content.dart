import 'package:engagment_calculator/config/theme.dart';
import 'package:engagment_calculator/view/ui/home/home.dart';
import 'package:flutter/material.dart';

class SplashScreenContent extends StatefulWidget {
  @override
  _SplashScreenContentState createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1900),
    );
    animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.easeInSine),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    animationController.forward();
    Future.delayed(Duration(milliseconds: 2300), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HomePage();
      }));
    });
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget widget) {
              return FadeTransition(
                opacity: animation,
                child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation.value), 0.0),
                  child: Container(
                      width: 150,
                      height: 150,
                      child: Image.asset("assets/image/icon.png")),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text:"From ",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: ThemeApp.secondaryColor),
                ),
                TextSpan(
                  text: "Iman Dev",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: ThemeApp.secondaryColor),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
