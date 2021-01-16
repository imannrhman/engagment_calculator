import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engagment_calculator/model/search_result.dart';
import 'package:engagment_calculator/service/repository.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  Repository _repository = Repository();


  @override
  Stream<SearchUserState> transformEvents(
      Stream<SearchUserEvent> events,
      Stream<SearchUserState> Function(SearchUserEvent event) next) {
    return super.transformEvents((events as Observable<SearchUserEvent>).debounceTime(
      Duration(milliseconds: 500),
    ), next);
  }

  @override
  void onTransition(Transition<SearchUserEvent, SearchUserState> transition) {
    print(transition);
  }


  @override
  SearchUserState get initialState => SearchStateEmpty();

  @override
  Stream<SearchUserState> mapEventToState(
    SearchUserEvent event,
  ) async* {
    if(event is TextChanged){
        final String searchTerm = event.text;
        if(searchTerm.isEmpty){
          yield SearchStateEmpty();
        }else{
          yield SearchStateLoading();
          try{
              SearchResult searchResult = await _repository.fetchSearchResult(query: event.text);
              yield SearchStateLoaded(searchResult: searchResult);
          }catch(e){
            yield e is SearchResultError ? SearchStateError(e.message):SearchStateError(e.toString());
          }
        }
    }

  }
}
