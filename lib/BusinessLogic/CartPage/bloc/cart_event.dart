part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartLoadEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}
