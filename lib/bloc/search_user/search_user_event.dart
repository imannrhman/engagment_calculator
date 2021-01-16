import 'package:equatable/equatable.dart';

abstract class SearchUserEvent extends Equatable {
  const SearchUserEvent();
}

class TextChanged extends SearchUserEvent{
  final String text;

  TextChanged({this.text});

  @override
  List<Object> get props => [text];

}