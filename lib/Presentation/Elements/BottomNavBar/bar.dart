import 'package:effmobtestapp/Presentation/Elements/BottomNavBar/item.dart';
import 'package:effmobtestapp/BusinessLogic/MainPage/bloc/main_bloc.dart';
import 'package:effmobtestapp/Presentation/Screens/Routes/routes.dart';
import 'package:effmobtestapp/Resources/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildBottomBar extends StatelessWidget {
  final bool fromListedPage;
  const BuildBottomBar({super.key, required this.fromListedPage});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            onTap: (currentIndex) {
              if (fromListedPage) {
                Navigator.of(context)
                  ..push(
                    // ignore: inference_failure_on_instance_creation
                    MaterialPageRoute(
                      builder: (_) => BlocProvider<MainBloc>.value(
                          value: MainBloc(ApiCategories()),
                          child: pages.elementAt(state.tabIndex)),
                    ),
                  )
                  ..pop()
                  ..pop();
                BlocProvider.of<MainBloc>(context)
                    .add(TabChange(tabIndex: currentIndex));
              } else {
                BlocProvider.of<MainBloc>(context)
                    .add(TabChange(tabIndex: currentIndex));
              }
            },
            unselectedItemColor: ApplicationColors.inactiveColor,
            selectedItemColor: ApplicationColors.activeColor,
            type: BottomNavigationBarType.fixed,
          );
        });
  }
}
