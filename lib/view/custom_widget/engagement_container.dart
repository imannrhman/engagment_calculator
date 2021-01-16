
import 'package:engagment_calculator/config/theme.dart';
import 'package:engagment_calculator/model/instagram_profile.dart';
import 'package:engagment_calculator/view/custom_widget/neumorphism_container.dart';
import 'package:flutter/material.dart';

class EngagementContainer extends StatefulWidget{
  final InstagramProfile instagramProfile;
  final AnimationController animationController;
  final Animation animation;

  const EngagementContainer({Key key, this.instagramProfile, this.animationController, this.animation}) : super(key: key);

  @override
  _EngagementContainerState createState() => _EngagementContainerState();
}

class _EngagementContainerState extends State<EngagementContainer> {
  double likePerPost ;
  double commentPerPost;
  double engagementPerPost;
  double engagementRate;
  List<Widget> listWidget;

  int getTotalLike(){
    int totalLike = 0;
    List<EdgeFelixVideoTimelineEdge> listEdge = widget.instagramProfile.graphql.user.edgeOwnerToTimelineMedia.edges;
    int length = listEdge.length > 10 ? 10 : listEdge.length;
    for(int i = 0;i <length;i++){
      totalLike += listEdge[i].node.edgeMediaPreviewLike.count;
    }
    return totalLike;
  }



  int getTotalComment(){
    int totalComment = 0;

    List<EdgeFelixVideoTimelineEdge> listEdge = widget.instagramProfile.graphql.user.edgeOwnerToTimelineMedia.edges;
    int length = listEdge.length > 10 ? 10 : listEdge.length;
    for(int i = 0;i <length;i++){
      totalComment += listEdge[i].node.edgeMediaPreviewLike.count;
    }return totalComment;
  }

  int getTotalPost(){
    return 10;
  }

  int getTotalFollower(){
    return widget.instagramProfile.graphql.user.edgeFollowedBy.count;
  }

  void calculateEngagementRate(){
      setState(() {
        engagementRate = ((likePerPost + commentPerPost) / getTotalFollower()) * 100;
      });
  }

  void calculateLikePerPost(){
      setState(() {
        likePerPost = getTotalLike()/getTotalPost();
      });
  }

  void calculateCommentPerPost(){
    setState(() {
      commentPerPost = getTotalComment()/getTotalPost();
    });
  }

  void calculateEngagementPerPost(){
    setState(() {
      engagementPerPost = engagementRate/getTotalPost();
    });
  }

  @override
  void initState() {
    super.initState();
    calculateLikePerPost();
    calculateCommentPerPost();
    calculateEngagementRate();
    calculateEngagementPerPost();

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context,Widget widgets){
        return FadeTransition(
          opacity: widget.animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation.value), 0.0),
            child: AspectRatio(
              aspectRatio: 0.75,
              child:GridView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  EngagementItem(
                    content: "${( engagementRate * widget.animation.value * widget.animation.value  * widget.animation.value * widget.animation.value ).toStringAsFixed(2)} %",
                    subtitle: "Engagment Rate",
                    margin: EdgeInsets.only(left: 16.0,right: 8.0,bottom: 16.0),
                    animation:
                    Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: widget.animationController,
                        curve: Interval((1 / 4) * 0, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    ),
                    animationController: widget.animationController,
                  ),
                  EngagementItem(
                    content: " ${(engagementPerPost * widget.animation.value  * widget.animation.value * widget.animation.value  * widget.animation.value ).toStringAsFixed(1)}",
                    subtitle: "Engagment/Post",
                    margin: EdgeInsets.only(left: 8.0,right: 16.0,bottom: 16.0),
                    animation: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: widget.animationController,
                        curve: Interval((1 / 4) * 1, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    ),
                    animationController: widget.animationController,
                  ),
                  EngagementItem(
                    content: "${(likePerPost * widget.animation.value * widget.animation.value  * widget.animation.value * widget.animation.value  * widget.animation.value).toStringAsFixed(1)}",
                    subtitle: "Like/Post",
                    margin: EdgeInsets.only(right: 8.0,left: 16.0,bottom: 16.0),
                    animation: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: widget.animationController,
                        curve: Interval((1 / 4) * 2, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    ),
                    animationController: widget.animationController,
                  ),
                  EngagementItem(
                    content: "${(commentPerPost * widget.animation.value * widget.animation.value  * widget.animation.value * widget.animation.value  * widget.animation.value).toStringAsFixed(1)}",
                    subtitle: "Comment/Post",
                    margin: EdgeInsets.only(left: 8.0,bottom: 16.0,right: 16.0),
                    animationController: widget.animationController,
                    animation: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: widget.animationController,
                        curve: Interval((1 / 4) * 3, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    ),
                  ),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


class EngagementItem extends StatelessWidget{
  final EdgeInsets margin;
  final String content;
  final String subtitle;
  final AnimationController animationController;
  final Animation animation;

  const EngagementItem({Key key, this.margin, this.content, this.subtitle, this.animationController, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context,Widget child){
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 *(1.0 - animation.value), 0.0),
            child: NeumorphismContainer(
              margin: margin,
              padding: EdgeInsets.all(8.0),
              color: ThemeApp.backgroundColor,
              curveType: CurveType.concave,
              borderRadius: 16.0,
              depth: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          foreground: Paint()
                            ..shader = ThemeApp.gradientInstagram
                                .createShader(Rect.fromLTWH(10.0, 10.0, 200.0, 50.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ThemeApp.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}