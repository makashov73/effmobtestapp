import 'package:effmobtestapp/BusinessLogic/MainPage/bloc/main_bloc.dart';
import 'package:effmobtestapp/Presentation/Elements/BottomNavBar/bar.dart';
import 'package:effmobtestapp/Presentation/Screens/Routes/routes.dart';
import 'package:effmobtestapp/Presentation/Elements/TopBar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: const TopBar(),
            body: Center(child: pages.elementAt(state.tabIndex)),
            bottomNavigationBar: const BuildBottomBar(),
          );
        });
  }
}
