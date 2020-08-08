import 'package:flutter/material.dart';

const Color primaryColor = Color.fromRGBO(62, 168, 164, 1);
const Color primaryLight = Color.fromRGBO(122, 204, 190, 1);
const Color accentColor = Color.fromRGBO(255, 88, 121, 1);
const Color accentLight = Color.fromRGBO(253, 153, 161, 1);
const Color white = Color.fromRGBO(255, 255, 255, 1);

double spacing(value) => value * 8.0;

BoxDecoration backgroundDefault() {
  return BoxDecoration(
    gradient: LinearGradient(
        colors: [
          primaryColor,
          accentColor,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        tileMode: TileMode.clamp),
  );
}

const List<Color> fases = [
  Color.fromRGBO(255, 43, 61, 1),
  Color.fromRGBO(255, 140, 0, 1),
  Color.fromRGBO(255, 255, 0, 1),
  Color.fromRGBO(112, 173, 71, 1),
  Color.fromRGBO(0, 176, 240, 1)
];