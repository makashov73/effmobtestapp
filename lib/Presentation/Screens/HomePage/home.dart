import 'package:effmobtestapp/BusinessLogic/HomePage/bloc/home_bloc.dart';
import 'package:effmobtestapp/Models/categories.dart';
import 'package:effmobtestapp/Resources/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        ApiCategories(),
      )..add(HomeLoadEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is FoodLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FoodLoadedState) {
            List<Data> foodList = state.data;
            return ListView.builder(
                itemCount: foodList.length,
                itemBuilder: (_, index) {
                  return Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 0,
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      height: 148,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(foodList[index].image.toString()),
                        ),
                      ),
                      child: SizedBox(
                        width: 25,
                        child: ListTile(
                          title: Text(
                            foodList[index].id == 1
                                ? 'Пекарни\nи кондитерские'
                                : foodList[index].name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          onTap: () =>
                              _navigateToPageDetails(context, foodList[index]),
                        ),
                      ),
                    ),
                  );
                });
          }
          if (state is FoodErrorState) {
            return const Center(
              child: Text("Error"),
            );
          }
          return Container();
        },
      ),
    );
  }

  // ignore: inference_failure_on_function_return_type
  _navigateToPageDetails(BuildContext context, Data index) async {
    await Navigator.pushNamed(context, '/details', arguments: index);
  }
}
