import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thailand_covid_19/const/colors.dart';
import 'package:thailand_covid_19/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;
  @override
  void initState() {
    controller = Get.put(HomeController());
    controller.setCovidToday();
    super.initState();
  }

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
              child: controller.obx(
                (state) {
                  return Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "สถานการณ์ COVID-19 ณ วันที่ 20 พ.ค. 2564 เวลา 11:54 น.",
                                style: TextStyle(
                                  color: AppColors.dark[300],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                onEmpty: Container(),
                onLoading: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.dark[400],
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
