part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchLoadEvent extends SearchEvent {
  @override
  List<Object?> get props => [];
}
