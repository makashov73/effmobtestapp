import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:effmobtestapp/pages/home.dart';

Future<dynamic> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food shop test app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'), // English
        Locale('en'), // Russian
      ],
      home: const Home(
        title: 'Test text for title',
      ),
    );
  }
}

class TextWrapper extends StatelessWidget {
  final String text;
  const TextWrapper({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    );
  }
}

class Location extends StatelessWidget {
  final int index;
  const Location({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final List<String> cities = ['Санкт-Петербург', 'Москва']; // список городов

    return Text(
      cities[index].toString(),
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}

class Date extends StatelessWidget {
  const Date({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    String locale = 'ru_RU';
    DateTime now = DateTime.now();
    String daymonth = DateFormat.MMMMd(locale).format(now);
    String year = DateFormat.y(locale).format(now);
    String formatted = '$daymonth, $year';
    return Text(formatted,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.5)));
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size.fromRadius(22),
        child: Image.network(
            'https://s3-alpha-sig.figma.com/img/738e/6e77/a92971e6075b85d18be0de93205d90cb?Expires=1687132800&Signature=FCndYJlBm8TzTblrx4DM7V0imqSpU9dyyIVL2LpAf6P1W4xO0gsuJp53OVqWc1A-qzsUHRK8NKhJnfmZOybn7AV7~OQGYAeKe7dnvh2ywbE6k5ojSxoesLjHn1f6bUAAF66dpBswZxD4M-hegplqKA0FCK5IrU99uIQQ33w0~UfrGOvaIJexw4h1emgUoNYpE6wdlpHgVx~6C1mc-K-YqSqGBr8dIcQa90ZnWL~mDWtPq67oJBWVUFrelJGlHKgsekVmYdVzbf9sYZdEj5279pqdinp2ps66tsgNJk3p3VG0Uew9WviJ8Bp2VacU8Czs4Bg5nzCOI2yHLGP6LTkm1g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
            fit: BoxFit.cover),
      ),
    );
  }
}

class NavBarItemSquare extends StatelessWidget {
  const NavBarItemSquare(
      {super.key, required this.text, required this.ratio, this.colorFilter});
  final String text;
  final double ratio;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      text,
      width: ratio,
      height: ratio,
      colorFilter: colorFilter,
    );
  }
}

class ApplicationColors {
  static const Color secondaryItem = Color.fromRGBO(165, 169, 178, 1);
  static const Color selectedColor = Color.fromRGBO(51, 100, 224, 1);
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on_outlined),
                      Location(index: 0), // хардкодим Питер
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 24),
                      ),
                      Date(),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  UserProfile(),
                ],
              )
            ]),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Main content is here',
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBottomBar() => BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        // unselectedItemColor:,
        selectedItemColor: ApplicationColors.selectedColor,
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
        onTap: (index) => setState(() => this.index = index),
      );

  // Widget buildPages() {
  //   switch (index) {
  //     case 0:
  //     return
  //   }
  // }
}
