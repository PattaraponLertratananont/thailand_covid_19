import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thailand_covid_19/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => HomeScreen()),
      ],
    );
  }
}
