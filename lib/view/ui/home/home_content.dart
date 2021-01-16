import 'package:engagment_calculator/bloc/search_user/bloc.dart';
import 'package:engagment_calculator/config/theme.dart';
import 'package:engagment_calculator/model/search_result.dart';
import 'package:engagment_calculator/view/custom_widget/custom_list_tile.dart';
import 'package:engagment_calculator/view/custom_widget/neumorphism_container.dart';
import 'package:engagment_calculator/view/ui/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with TickerProviderStateMixin {
  SearchUserBloc searchProfileBloc;
  TextEditingController searchUsername;
  AnimationController animationController;



  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    super.initState();
    searchUsername = TextEditingController();
    searchProfileBloc = BlocProvider.of<SearchUserBloc>(context);
  }

  @override
  void dispose() {
    searchProfileBloc.close();
    searchUsername.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return ListView(
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        BuildLogoView(
          animationController: animationController,
          animation: Tween(begin: 10.0, end: 1.5).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval((1 / 2) * 0, 1.0,
                curve: Curves.fastOutSlowIn),
          ),),
        ),
        BuildSearchView(
          animationController: animationController,
          searchProfileBloc: searchProfileBloc,
          searchUsername: searchUsername,
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval((1 / 2) * 1, 1.0,
                curve: Curves.fastOutSlowIn),
          )),
        ),
        BlocBuilder<SearchUserBloc, SearchUserState>(
          builder: (BuildContext context, SearchUserState state) {
            if (state is SearchStateLoading) {
              return buildDataLoading();
            }
            if (state is SearchStateLoaded) {
              return buildDataLoaded(
                searchResult: state.searchResult,
              );
            }
            if (state is SearchStateError) {
              return buildDataError(message: state.message);
            }
            return initialBuild();
          },
        ),
      ],
    );
  }

  Widget initialBuild() {
    return Container();
  }

  Widget buildDataError({String message}) {
    return Center(
      child: Text(message),
    );
  }

  Widget buildDataLoaded({SearchResult searchResult, Animation animation}) {
    return DataLoadedView(
      searchResult: searchResult,
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

class BuildLogoView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const BuildLogoView({Key key, this.animationController, this.animation})
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
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Container(
              margin: EdgeInsets.only(
                  top: 48.0, left: 16.0, right: 16.0, bottom: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ShaderMask(
                    child: SvgPicture.asset(
                      "assets/icon/logos_instagram.svg",
                    ),
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return ThemeApp.gradientInstagram
                          .createShader(Rect.fromLTWH(2.0, 2.0, 400.0, 150.0));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Engagment Rate Calculator App",textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: ThemeApp.secondaryColor,
                        ),),
                      ],
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

class BuildSearchView extends StatelessWidget {
  final SearchUserBloc searchProfileBloc;
  final TextEditingController searchUsername;
  final AnimationController animationController;
  final Animation animation;

  const BuildSearchView(
      {Key key,
      this.searchProfileBloc,
      this.searchUsername,
      this.animationController,
      this.animation})
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
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Container(
              height: 60.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: NeumorphismContainer(
                      curveType: CurveType.concave,
                      height: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 16.0),
                      margin: EdgeInsets.only(right: 16.0),
                      width: double.infinity,
                      borderRadius: 16.0,
                      color: ThemeApp.backgroundColor,
                      depth: 5,
                      child: TextFormField(
                        cursorColor: Colors.pink,
                        onChanged: (text) {
                          searchProfileBloc.add(TextChanged(text: text));
                        },
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ThemeApp.primaryColor,
                        ),
                        controller: searchUsername,
                        decoration: InputDecoration(
                          hintText: "Isi username Instagram disini",
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic,
                            color: ThemeApp.secondaryColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: NeumorphismContainer(
                      color: ThemeApp.backgroundColor,
                      curveType: CurveType.concave,
                      borderRadius: 16.0,
                      depth: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (Rect bounds) {
                                  return ThemeApp.gradientInstagram
                                      .createShader(
                                          Rect.fromLTWH(6.0, 2.0, 10.0, 30.0));
                                },
                                child: Icon(Icons.search),
                              ),
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return ProfilePage(
                                          username: searchUsername.text,
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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

class DataLoadedView extends StatefulWidget {
  final SearchResult searchResult;

  const DataLoadedView({Key key, this.searchResult}) : super(key: key);

  @override
  _DataLoadedViewState createState() => _DataLoadedViewState();
}

class _DataLoadedViewState extends State<DataLoadedView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation = Tween(begin: 0.0, end: 1.5).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval((1 / 1) * 0, 1.0
            , curve: Curves.fastOutSlowIn),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget widgets) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: NeumorphismContainer(
              depth: 3,
              borderRadius: 16,
              margin: EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 32.0, top: 32.0),
              curveType: CurveType.concave,
              color: ThemeApp.backgroundColor,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: widget.searchResult.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    animationController.forward();
                    return CustomListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context){
                            return ProfilePage(username: widget.searchResult.users[index].user.username,);
                          }
                        ));
                      },
                      title: widget.searchResult.users[index].user.fullName,
                      subtitle: widget.searchResult.users[index].user.username,
                      imgUrl:
                          widget.searchResult.users[index].user.profilePicUrl,
                      animation: Tween(begin: 0.0, end: 1.5).animate(
                        CurvedAnimation(
                          parent: animationController,
                          curve: Interval(
                              (1 / widget.searchResult.users.length) * index,
                              1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      ),
                      animationController: animationController,
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
