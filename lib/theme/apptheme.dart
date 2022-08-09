import 'package:flutter/material.dart';
import 'package:intp22_vis_3/theme/palette.dart';

class AppTheme {
  static ThemeData get basic => ThemeData(
      primaryColorDark: Color(0xff180465),
      primaryColor: Color.fromARGB(255, 26, 24, 192),
      primaryColorLight: Color(0xff37b1d4),
      focusColor: Color.fromARGB(255, 202, 42, 47),
      brightness: Brightness.dark,
      primarySwatch: Palette.darkT,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: const Color(0xff8a3139))
              .merge(ButtonStyle(elevation: MaterialStateProperty.all(0)))),
      canvasColor: Color.fromARGB(255, 55, 51, 50),
      cardColor: Color.fromARGB(255, 77, 76, 76),
      
  );
}
