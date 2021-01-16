import 'package:equatable/equatable.dart';

abstract class InstagramProfileEvent extends Equatable {
  const InstagramProfileEvent();

}


class GetInstagramProfileFromAPI extends InstagramProfileEvent{
  final String username;

  GetInstagramProfileFromAPI({this.username});

  @override
  List<Object> get props => [username];
}
