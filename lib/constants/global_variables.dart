import 'package:flutter/material.dart';

String uri = 'http://localhost:3000';

class GlobalVariables {
  static const appBarGradient = LinearGradient(colors: [
    Color.fromARGB(255, 103, 181, 177),
    Color.fromARGB(255, 125, 221, 216),
  ], stops: [
    0.5,
    1.0
  ]);

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}
