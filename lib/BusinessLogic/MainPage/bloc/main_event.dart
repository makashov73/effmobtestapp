part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class TabChange extends MainEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
