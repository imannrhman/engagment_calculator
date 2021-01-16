import 'package:engagment_calculator/bloc/instagram_profile/bloc.dart';
import 'package:engagment_calculator/config/theme.dart';
import 'package:engagment_calculator/model/instagram_profile.dart';
import 'package:engagment_calculator/view/custom_widget/engagement_container.dart';
import 'package:engagment_calculator/view/custom_widget/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent>
with TickerProviderStateMixin{
  AnimationController animationController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    animationController = AnimationController(
      duration:Duration(milliseconds: 2000),
      vsync: this,
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
    return BlocBuilder<InstagramProfileBloc, InstagramProfileState>(
      builder: (BuildContext context, InstagramProfileState state) {
        if (state is InstagramProfileLoading) {
          return buildDataLoading();
        }
        if (state is InstagramProfileLoaded) {
          return buildDataLoaded(instagramProfile: state.instagramProfile);
        }
        if (state is InstagramProfileError) {
          return buildDataError(message: state.message);
        }

        return Container();
      },
    );
  }


  Widget buildDataError({String message}) {
    return Center(
      child: Text(message),
    );
  }

  Widget buildDataLoaded({InstagramProfile instagramProfile}) {
    List<Widget> listWidget = [
      AppBar(),
      ProfileContainer(
        animationController: animationController,
        animation: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
          parent: animationController,
          curve: Interval((1/2)*0,1.0,curve: Curves.fastLinearToSlowEaseIn),
        )),
        instagramProfile: instagramProfile,
      ),
      EngagementContainer(
        animationController: animationController,
        animation: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
          parent: animationController,
          curve: Interval((1/2)*1,1.0,curve: Curves.fastLinearToSlowEaseIn),
        )),
        instagramProfile: instagramProfile,
      ),
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: listWidget.length,
      itemBuilder: (BuildContext context,int index){
      animationController.forward();
        return listWidget[index];
      },
    );
  }

  Widget buildDataLoading() {
    return Center(
      child: ShaderMask(
        child: SpinKitDoubleBounce(
          color: Colors.pink,
          size: 25.0,
        ),
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) {
          return ThemeApp.gradientInstagram
              .createShader(Rect.fromLTWH(2.0, 2.0, 350.0, 100.0));
        },
      ),
    );
  }

}
