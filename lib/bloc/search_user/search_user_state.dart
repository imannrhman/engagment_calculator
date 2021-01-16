import 'package:engagment_calculator/model/search_result.dart';
import 'package:equatable/equatable.dart';

abstract class SearchUserState extends Equatable {
  const SearchUserState();
}

class SearchStateEmpty extends SearchUserState {
  @override
  List<Object> get props => [];
}

class SearchStateLoading extends SearchUserState{
  @override
  List<Object> get props => [];
}

class SearchStateLoaded extends SearchUserState{
  final SearchResult searchResult;

  SearchStateLoaded({this.searchResult});
  @override
  List<Object> get props => [searchResult];
}

class SearchStateError extends SearchUserState{
  final String message;

  SearchStateError(this.message);
  @override
  List<Object> get props => [message];

}
