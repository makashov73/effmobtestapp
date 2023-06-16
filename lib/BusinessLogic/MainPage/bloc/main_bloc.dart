import 'package:effmobtestapp/Resources/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(ApiCategories apiService) : super(const MainInitial(tabIndex: 0)) {
    on<MainEvent>((event, emit) {
      if (event is TabChange) {
        emit(MainInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
