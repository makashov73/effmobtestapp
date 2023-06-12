import 'package:flutter/material.dart';
import 'itembar.dart';

class ApplicationColors {
  static const Color secondaryItem = Color.fromRGBO(165, 169, 178, 1);
  static const Color selectedColor = Color.fromRGBO(51, 100, 224, 1);
}

class BuildBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const BuildBottomBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: NavBarItemSquare(
            text: 'assets/images/home.svg',
            ratio: 24,
            colorFilter: ColorFilter.mode(
                ApplicationColors.selectedColor, BlendMode.srcIn),
          ),
          icon: NavBarItemSquare(
            text: 'assets/images/home.svg',
            ratio: 24,
            colorFilter: ColorFilter.mode(
                ApplicationColors.secondaryItem, BlendMode.srcIn),
          ),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          activeIcon: NavBarItemSquare(
            text: 'assets/images/search.svg',
            ratio: 24,
            colorFilter: ColorFilter.mode(
                ApplicationColors.selectedColor, BlendMode.srcIn),
          ),
          icon: NavBarItemSquare(
            text: 'assets/images/search.svg',
            ratio: 24,
            colorFilter: ColorFilter.mode(
                ApplicationColors.secondaryItem, BlendMode.srcIn),
          ),
          label: 'Поиск',
        ),
        BottomNavigationBarItem(
          activeIcon: NavBarItemSquare(
            text: 'assets/images/bag.svg',
            ratio: 24,
            colorFilter: ColorFilter.mode(
                ApplicationColors.selectedColor, BlendMode.srcIn),
          ),
          icon: NavBarItemSquare(
            text: 'assets/images/bag.svg',
            ratio: 24,
            colorFilter: ColorFilter.mode(
                ApplicationColors.secondaryItem, BlendMode.srcIn),
          ),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          activeIcon: NavBarItemSquare(
            text: 'assets/images/profile.svg',
            ratio: 24,
            colorFilter: ColorFilter.mode(
                ApplicationColors.selectedColor, BlendMode.srcIn),
          ),
          icon: NavBarItemSquare(
            text: 'assets/images/profile.svg',
            ratio: 24,
            colorFilter: ColorFilter.mode(
                ApplicationColors.secondaryItem, BlendMode.srcIn),
          ),
          label: 'Аккаунт',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
      unselectedItemColor: ApplicationColors.secondaryItem,
      selectedItemColor: ApplicationColors.selectedColor,
      type: BottomNavigationBarType.fixed,
    );
  }
}
