import 'package:engagment_calculator/model/instagram_profile.dart';
import 'package:equatable/equatable.dart';

abstract class InstagramProfileState extends Equatable {
  const InstagramProfileState();
}

class InstagramProfileInitial extends InstagramProfileState {
  @override
  List<Object> get props => [];
}

class InstagramProfileLoading extends InstagramProfileState{
  @override
  List<Object> get props => [];
}

class InstagramProfileLoaded extends InstagramProfileState{
  final InstagramProfile instagramProfile;

  InstagramProfileLoaded({this.instagramProfile});

  @override
  List<Object> get props => [instagramProfile];

}

class InstagramProfileError extends InstagramProfileState{
  final String message;

  InstagramProfileError({this.message});

  @override
  List<Object> get props => [message];

}