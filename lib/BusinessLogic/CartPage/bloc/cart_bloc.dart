import 'package:effmobtestapp/Models/dishes.dart';
import 'package:effmobtestapp/Resources/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ApiDishes apiDishes;

  CartBloc(this.apiDishes) : super(CartLoadingState()) {
    on<CartLoadEvent>((event, emit) async {
      emit(CartLoadingState());
      try {
        final data = await apiDishes.getDishesList();
        emit(CartLoadedState(data));
      } catch (e) {
        emit(CartErrorState(e.toString()));
      }
    });
  }
}
