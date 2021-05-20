import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:thailand_covid_19/const/colors.dart';
import 'package:thailand_covid_19/screens/home.dart';

void main() {
  initializeDateFormatting("th");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Thailand COVID-19",
      color: AppColors.dark,
      theme: ThemeData(fontFamily: GoogleFonts.kanit().fontFamily),
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => HomeScreen()),
      ],
    );
  }
}
