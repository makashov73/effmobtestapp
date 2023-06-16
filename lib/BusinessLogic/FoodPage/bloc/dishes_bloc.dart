import 'package:effmobtestapp/Models/dishes.dart';
import 'package:effmobtestapp/Resources/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dishes_event.dart';
part 'dishes_state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final ApiDishes apiDishes;

  DishesBloc(this.apiDishes) : super(DishesLoadingState()) {
    on<DishesLoadEvent>((event, emit) async {
      emit(DishesLoadingState());
      try {
        final data = await apiDishes.getDishesList();
        emit(DishesLoadedState(data));
      } catch (e) {
        emit(DishesErrorState(e.toString()));
      }
    });
  }
}
