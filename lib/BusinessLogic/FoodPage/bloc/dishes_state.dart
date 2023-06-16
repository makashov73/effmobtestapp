part of 'dishes_bloc.dart';

@immutable
abstract class DishesState extends Equatable {}

class DishesLoadingState extends DishesState {
  @override
  List<Object?> get props => [];
}

class DishesLoadedState extends DishesState {
  final List<Dishes> data;
  DishesLoadedState(this.data);
  @override
  List<Object?> get props => [data];
}

class DishesErrorState extends DishesState {
  final String error;
  DishesErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
