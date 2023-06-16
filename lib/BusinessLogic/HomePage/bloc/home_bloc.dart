import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:effmobtestapp/Resources/api.dart';
import 'package:meta/meta.dart';
import 'package:effmobtestapp/Models/categories.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiCategories apiCategories;

  HomeBloc(this.apiCategories) : super(FoodLoadingState()) {
    on<HomeLoadEvent>((event, emit) async {
      emit(FoodLoadingState());
      try {
        final data = await apiCategories.getCatigoryList();
        emit(FoodLoadedState(data));
      } catch (e) {
        emit(FoodErrorState(e.toString()));
      }
    });
  }
}
