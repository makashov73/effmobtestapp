import 'package:effmobtestapp/BusinessLogic/MainPage/bloc/main_bloc.dart';
import 'package:effmobtestapp/Presentation/MainPage/main.dart';
import 'package:effmobtestapp/Presentation/Screens/HomePage/home.dart';
import 'package:effmobtestapp/Presentation/Screens/SearchPage/search.dart';
import 'package:effmobtestapp/Presentation/Screens/CartPage/cart.dart';
import 'package:effmobtestapp/Presentation/Screens/ProfilePage/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<Widget> pages = <Widget>[Home(), Search(), Cart(), Profile()];

class RouteGenerator {
  final MainBloc mainBloc = MainBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<MainBloc>.value(
            value: mainBloc,
            child: const MainPage(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
