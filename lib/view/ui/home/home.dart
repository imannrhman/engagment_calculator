import 'package:engagment_calculator/bloc/search_user/bloc.dart';
import 'package:engagment_calculator/view/ui/home/home_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchUserBloc>(
      create: (BuildContext context) {
        return SearchUserBloc();
      },
      child: Scaffold(
        body: HomeContent(),
      ),
    );
  }
}
