import 'package:effmobtestapp/Presentation/Elements/BottomNavBar/icon.dart';
import 'package:flutter/material.dart';

class ApplicationColors {
  static const Color inactiveColor = Color.fromRGBO(165, 169, 178, 1);
  static const Color activeColor = Color.fromRGBO(51, 100, 224, 1);
}

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    activeIcon: NavBarItemSquare(
      src: 'assets/images/home.svg',
      ratio: 24,
      colorFilter:
          ColorFilter.mode(ApplicationColors.activeColor, BlendMode.srcIn),
    ),
    icon: NavBarItemSquare(
      src: 'assets/images/home.svg',
      ratio: 24,
      colorFilter:
          ColorFilter.mode(ApplicationColors.inactiveColor, BlendMode.srcIn),
    ),
    label: 'Главная',
  ),
  BottomNavigationBarItem(
    activeIcon: NavBarItemSquare(
      src: 'assets/images/search.svg',
      ratio: 24,
      colorFilter:
          ColorFilter.mode(ApplicationColors.activeColor, BlendMode.srcIn),
    ),
    icon: NavBarItemSquare(
      src: 'assets/images/search.svg',
      ratio: 24,
      colorFilter:
          ColorFilter.mode(ApplicationColors.inactiveColor, BlendMode.srcIn),
    ),
    label: 'Поиск',
  ),
  BottomNavigationBarItem(
    activeIcon: NavBarItemSquare(
      src: 'assets/images/bag.svg',
      ratio: 24,
      colorFilter:
          ColorFilter.mode(ApplicationColors.activeColor, BlendMode.srcIn),
    ),
    icon: NavBarItemSquare(
      src: 'assets/images/bag.svg',
      ratio: 24,
      colorFilter:
          ColorFilter.mode(ApplicationColors.inactiveColor, BlendMode.srcIn),
    ),
    label: 'Корзина',
  ),
  BottomNavigationBarItem(
    activeIcon: NavBarItemSquare(
      src: 'assets/images/profile.svg',
      ratio: 24,
      colorFilter:
          ColorFilter.mode(ApplicationColors.activeColor, BlendMode.srcIn),
    ),
    icon: NavBarItemSquare(
      src: 'assets/images/profile.svg',
      ratio: 24,
      colorFilter:
          ColorFilter.mode(ApplicationColors.inactiveColor, BlendMode.srcIn),
    ),
    label: 'Аккаунт',
  ),
];
