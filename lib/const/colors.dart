import 'package:flutter/material.dart';

class AppColors {
  static Color white = Color(0xFFF2F2F2);
  static int _darkDefault = 0xFF3B414A;
  static MaterialColor dark = MaterialColor(_darkDefault, <int, Color>{
    600: Color(0xFF202630),
    500: Color(_darkDefault),
    400: Color(0xFF575D67),
    300: Color(0xFF9BA1AA),
  });
  static int _redDefault = 0xFFE4305B;
  static MaterialColor red = MaterialColor(_redDefault, <int, Color>{
    500: Color(_redDefault),
    400: Color(0xFFF86487),
    300: Color(0xFFFFADC1),
  });
  static int _greenDefault = 0xFF88DC1D;
  static MaterialColor green = MaterialColor(_greenDefault, <int, Color>{
    500: Color(_greenDefault),
    400: Color(0xFFA5E753),
    300: Color(0xFFBFEB88),
  });
  static int _yellowDefault = 0xFFF0DC28;
  static MaterialColor yellow = MaterialColor(_yellowDefault, <int, Color>{
    500: Color(_yellowDefault),
    400: Color(0xFFF2E570),
    300: Color(0xFFF1E99C),
  });
  static int _blueDefault = 0xFF2AAED8;
  static MaterialColor blue = MaterialColor(_blueDefault, <int, Color>{
    500: Color(_blueDefault),
    400: Color(0xFF5EBFDE),
    300: Color(0xFF99D3E5),
  });
}
