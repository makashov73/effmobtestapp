import 'package:flutter/material.dart';

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
