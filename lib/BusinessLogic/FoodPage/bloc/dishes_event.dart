part of 'dishes_bloc.dart';

@immutable
abstract class DishesEvent extends Equatable {
  const DishesEvent();
}

class DishesLoadEvent extends DishesEvent {
  @override
  List<Object?> get props => [];
}
