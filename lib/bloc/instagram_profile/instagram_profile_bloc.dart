import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engagment_calculator/model/instagram_profile.dart';
import 'package:engagment_calculator/service/repository.dart';
import './bloc.dart';

class InstagramProfileBloc extends Bloc<InstagramProfileEvent, InstagramProfileState> {
  Repository repository = Repository();
  @override
  InstagramProfileState get initialState => InstagramProfileInitial();

  @override
  Stream<InstagramProfileState> mapEventToState(
    InstagramProfileEvent event,
  ) async* {
    if(event is GetInstagramProfileFromAPI){
      yield InstagramProfileLoading();
      try{
        InstagramProfile instagramProfile  = await repository.fetchInstagramProfile(username: event.username);
        yield InstagramProfileLoaded(instagramProfile: instagramProfile);
      }catch(e){
        yield InstagramProfileError(message: e.toString());
      }
    }
  }
}
