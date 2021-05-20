import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thailand_covid_19/const/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Container(
        padding: EdgeInsets.only(
          top: Get.mediaQuery.padding.top,
          bottom: Get.mediaQuery.padding.bottom,
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            Container(
              width: Get.width,
              margin: EdgeInsets.only(top: 8, bottom: 24),
              child: Text(
                "Thailand COVID-19",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.dark[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.3,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.dark[600],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "WOW",
                style: TextStyle(
                  color: AppColors.dark[300],
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
