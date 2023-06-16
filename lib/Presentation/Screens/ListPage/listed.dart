import 'package:effmobtestapp/BusinessLogic/ListPage/bloc/listed_bloc.dart';
import 'package:effmobtestapp/Presentation/Elements/BottomNavBar/bar.dart';
import 'package:effmobtestapp/Presentation/Elements/TopBar/bar.dart';
import 'package:effmobtestapp/Presentation/Screens/FoodPage/food.dart';
import 'package:flutter/material.dart';
import 'package:effmobtestapp/Models/categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Listed extends StatelessWidget {
  final Data index;
  const Listed({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListBloc>(
      create: (context) => ListBloc(),
      child: BlocBuilder<ListBloc, ListState>(builder: (context, state) {
        return Scaffold(
          appBar: TopBar(
              type: 'listed',
              name: index.id == 1 ? 'Пекарни и кондитерские' : index.name),
          body: Center(child: FoodPage(pageId: index.id)),
          bottomNavigationBar: const BuildBottomBar(fromListedPage: true),
        );
      }),
    );
  }
}
