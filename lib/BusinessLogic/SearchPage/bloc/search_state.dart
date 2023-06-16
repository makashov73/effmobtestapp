part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoadedState extends SearchState {
  final List<Dishes> data;
  SearchLoadedState(this.data);
  @override
  List<Object?> get props => [data];
}

class SearchErrorState extends SearchState {
  final String error;
  SearchErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
