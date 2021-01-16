import 'package:engagment_calculator/config/theme.dart';
import 'package:engagment_calculator/model/instagram_profile.dart';
import 'package:engagment_calculator/view/custom_widget/neumorphism_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cirlce_profile.dart';

class ProfileContainer extends StatelessWidget {
  final InstagramProfile instagramProfile;
  final AnimationController animationController;
  final Animation animation;

  const ProfileContainer({Key key, this.instagramProfile, this.animationController, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        return FadeTransition(
          opacity:animation,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 30 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:16.0),
              child: Stack(
                children: <Widget>[
                  NeumorphismContainer(
                    height: 240,
                    curveType: CurveType.concave,
                    margin: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
                    color: ThemeApp.backgroundColor,
                    borderRadius: 16.0,
                    depth: 10,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top:32.0),
                              child: Text(
                                instagramProfile.graphql.user.fullName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                  color: ThemeApp.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children:[
                              ItemInfoInstagram(
                                title: "Postingan",
                                content: NumberFormat.compact().format((instagramProfile.graphql.user.edgeOwnerToTimelineMedia.count * animation.value ).toInt()),
                              ),
                              ItemInfoInstagram(
                                  title: "Pengikut",
                                  content: NumberFormat.compact().format((instagramProfile.graphql.user.edgeFollowedBy.count * animation.value).toInt()),
                              ),
                              ItemInfoInstagram(
                                title: "Mengikuti",
                                content: NumberFormat.compact().format((instagramProfile.graphql.user.edgeFollow.count * animation.value).toInt()),
                              ),
                            ],)
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircleProfile(
                      height: 100.0,
                      width: 100.0,
                      imgSource: instagramProfile.graphql.user.profilePicUrlHd,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ItemInfoInstagram extends StatelessWidget {
  final String title;
  final String content;
  final Animation animation;

  const ItemInfoInstagram({Key key, this.title, this.content, this.animation}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: NeumorphismContainer(
        depth: 3,
        spread: 10.0,
        curveType: CurveType.concave,
        color: ThemeApp.backgroundColor,
        borderRadius: 16.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  foreground: Paint()
                    ..shader = ThemeApp.gradientInstagram
                        .createShader(Rect.fromLTWH(0.0, 0.0, 400.0, 100.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: ThemeApp.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
