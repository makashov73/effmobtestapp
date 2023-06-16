part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class FoodLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class FoodLoadedState extends HomeState {
  final List<Data> data;
  FoodLoadedState(this.data);
  @override
  List<Object?> get props => [data];
}

class FoodErrorState extends HomeState {
  final String error;
  FoodErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
