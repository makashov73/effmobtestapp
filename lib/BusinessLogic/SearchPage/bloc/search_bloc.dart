import 'package:effmobtestapp/Models/dishes.dart';
import 'package:effmobtestapp/Resources/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiDishes apiDishes;

  SearchBloc(this.apiDishes) : super(SearchLoadingState()) {
    on<SearchLoadEvent>((event, emit) async {
      emit(SearchLoadingState());
      try {
        final data = await apiDishes.getDishesList();
        emit(SearchLoadedState(data));
      } catch (e) {
        emit(SearchErrorState(e.toString()));
      }
    });
  }
}
