import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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
