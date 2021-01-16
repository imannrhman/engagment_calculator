import 'package:engagment_calculator/bloc/instagram_profile/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_content.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({Key key, this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InstagramProfileBloc>(
      create: (BuildContext context) {
        return InstagramProfileBloc()..add(GetInstagramProfileFromAPI(
           username: username,
        ));
      },
      child: Scaffold(
        body: ProfileContent(
        ),
      ),
    );
  }
}
