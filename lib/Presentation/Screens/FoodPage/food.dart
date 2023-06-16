import 'package:effmobtestapp/BusinessLogic/FoodPage/bloc/dishes_bloc.dart';
import 'package:effmobtestapp/Models/dishes.dart';
import 'package:effmobtestapp/Resources/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodPage extends StatelessWidget {
  final int pageId;
  const FoodPage({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    switch (pageId) {
      default:
        return BlocProvider<DishesBloc>(
          create: (context) => DishesBloc(
            ApiDishes(),
          )..add(DishesLoadEvent()),
          child: BlocBuilder<DishesBloc, DishesState>(
            builder: (context, state) {
              if (state is DishesLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is DishesLoadedState) {
                List<Dishes> dishesList = state.data;
                List<String> tabsName = [
                  'Все меню',
                  'Салаты',
                  'С рисом',
                  'С рыбой'
                ];
                return DefaultTabController(
                  length: tabsName.length,
                  child: Builder(builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0.0),
                          child: TabBar(
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            unselectedLabelStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: const EdgeInsets.all(8),
                            isScrollable: true,
                            overlayColor: MaterialStateColor.resolveWith(
                              (states) =>
                                  const Color.fromRGBO(248, 247, 245, 1.0),
                            ),
                            labelColor: Colors.white,
                            labelStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            unselectedLabelColor:
                                const Color.fromRGBO(0, 0, 0, 1.0),
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(51, 100, 224, 1.0),
                            ),
                            tabs: tabsName
                                .map((tabName) => Tab(
                                    child: Text(tabName,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400))))
                                .toList(),
                          ),
                        ),
                      ),
                      body: TabBarView(children: [
                        GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 1.0,
                                  crossAxisSpacing: 5,
                                  mainAxisExtent: 170),
                          itemCount: dishesList.length,
                          itemBuilder: (context, index) => Stack(children: [
                            GestureDetector(
                              onTap: () =>
                                  _dialogBuilder(context, dishesList, index),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromRGBO(
                                            248, 247, 245, 1.0),
                                      ),
                                      child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.network(
                                            dishesList[index].image!.toString(),
                                            fit: BoxFit.scaleDown,
                                          )),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dishesList[index].name!,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ]),
                            ),
                          ]),
                        ),
                        const Center(child: Text('Заглушка для фильтра')),
                        const Center(child: Text('Заглушка для фильтра')),
                        const Center(child: Text('Заглушка для фильтра')),
                      ]),
                    );
                  }),
                );
              }
              if (state is DishesErrorState) {
                return const Center(
                  child: Text("Error"),
                );
              }
              return Container();
            },
          ),
        );
      // default:
      //   return const Scaffold(
      //     body: Text('null'),
      //   );
    }
  }

  Future<void> _dialogBuilder(
      BuildContext context, List<dynamic> dishesList, int index) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
          titlePadding: const EdgeInsets.all(0),
          title: Container(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.favorite_outline),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ]),
          ),
          content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(248, 247, 245, 1.0),
                  ),
                  child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(
                        dishesList[index].image!.toString(),
                        fit: BoxFit.scaleDown,
                      )),
                ),
                Text(
                  dishesList[index].name!.toString(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(
                  '${dishesList[index].price!.toString()}  ₽ · ${dishesList[index].weight!}г',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(
                  dishesList[index].description!.toString(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: const Color.fromRGBO(51, 100, 224, 1.0),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Добавить в корзину",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ]),
        );
      },
    );
  }
}
