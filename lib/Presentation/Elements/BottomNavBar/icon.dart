import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItemSquare extends StatelessWidget {
  const NavBarItemSquare(
      {super.key, required this.src, required this.ratio, this.colorFilter});
  final String src;
  final double ratio;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      src,
      width: ratio,
      height: ratio,
      colorFilter: colorFilter,
    );
  }
}
