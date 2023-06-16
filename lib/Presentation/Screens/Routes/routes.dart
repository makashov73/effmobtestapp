import 'package:effmobtestapp/BusinessLogic/ListPage/bloc/listed_bloc.dart';
import 'package:effmobtestapp/BusinessLogic/MainPage/bloc/main_bloc.dart';
import 'package:effmobtestapp/Presentation/MainPage/main.dart';
import 'package:effmobtestapp/Presentation/Screens/ListPage/listed.dart';
import 'package:effmobtestapp/Presentation/Screens/HomePage/home.dart';
import 'package:effmobtestapp/Presentation/Screens/SearchPage/search.dart';
import 'package:effmobtestapp/Presentation/Screens/CartPage/cart.dart';
import 'package:effmobtestapp/Presentation/Screens/ProfilePage/profile.dart';
import 'package:effmobtestapp/Resources/api.dart';
import 'package:effmobtestapp/Models/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<Widget> pages = <Widget>[Home(), Search(), Cart(), Profile()];

class RouteGenerator {
  final MainBloc mainBloc = MainBloc(ApiCategories());
  final ListBloc listBloc = ListBloc();
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
      case '/details':
        if (args is Data) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<MainBloc>.value(
              value: mainBloc,
              child: Listed(
                index: args,
              ),
            ),
          );
        }
        return _errorRoute();
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
