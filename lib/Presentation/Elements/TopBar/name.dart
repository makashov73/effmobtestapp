import 'package:flutter/material.dart';

class CategoryName extends StatelessWidget {
  final String name;
  const CategoryName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}
