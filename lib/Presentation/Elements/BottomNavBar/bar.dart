import 'package:effmobtestapp/Presentation/Elements/BottomNavBar/item.dart';
import 'package:effmobtestapp/BusinessLogic/MainPage/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildBottomBar extends StatelessWidget {
  const BuildBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            onTap: (currentIndex) {
              BlocProvider.of<MainBloc>(context)
                  .add(TabChange(tabIndex: currentIndex));
            },
            unselectedItemColor: ApplicationColors.inactiveColor,
            selectedItemColor: ApplicationColors.activeColor,
            type: BottomNavigationBarType.fixed,
          );
        });
  }
}
