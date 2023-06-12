import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
