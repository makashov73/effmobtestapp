part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {}

class CartLoadingState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoadedState extends CartState {
  final List<Dishes> data;
  CartLoadedState(this.data);
  @override
  List<Object?> get props => [data];
}

class CartErrorState extends CartState {
  final String error;
  CartErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
