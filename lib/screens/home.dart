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
              margin: EdgeInsets.only(top: 16, bottom: 16),
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
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.dark[600],
                borderRadius: BorderRadius.circular(8),
              ),
              child: controller.obx(
                (state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            titleCard("สถานการณ์ COVID-19 วันนี้"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            newConfirmed(),
                            newHospitalized(),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            newRecovered(),
                            newDeaths(),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "ข้อมูลเมื่อ ${controller.covidToday.value.updateDate}",
                            style: TextStyle(
                              color: AppColors.dark[400],
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                onEmpty: cardEmpty(),
                onError: (error) => cardError(),
                onLoading: cardLoading(),
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: Get.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.dark[600],
                borderRadius: BorderRadius.circular(8),
              ),
              child: controller.obx(
                (state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          titleCard("สถานการณ์ COVID-19 โดยรวม"),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "ผู้ติดเขื้อสะสม ",
                                  style: TextStyle(
                                    color: AppColors.dark[300],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  controller.covidToday.value.confirmed,
                                  style: TextStyle(
                                    color: AppColors.yellow,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "รักษาตัวอยู่ ",
                                  style: TextStyle(
                                    color: AppColors.dark[300],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  controller.covidToday.value.hospitalized,
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "รักษาหายแล้ว ",
                                  style: TextStyle(
                                    color: AppColors.dark[300],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  controller.covidToday.value.recovered,
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "เสียชีวิต ",
                                  style: TextStyle(
                                    color: AppColors.dark[300],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  controller.covidToday.value.deaths,
                                  style: TextStyle(
                                    color: AppColors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                onEmpty: cardEmpty(),
                onError: (error) => cardError(),
                onLoading: cardLoading(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleCard(String title) {
    return Expanded(
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.dark[300],
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget cardEmpty() {
    return Center(
      child: TextButton(
        child: Text(
          "ไม่มีข้อมูล กดเพื่อดึงข้อมูลอีกครั้ง",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(AppColors.dark[300])),
        onPressed: () {
          controller.setCovidToday();
        },
      ),
    );
  }

  Widget cardLoading() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.dark[400],
        color: AppColors.white,
      ),
    );
  }

  Widget cardError() {
    return Center(
      child: TextButton(
        child: Text(
          "เกิดข้อผิดพลาด กดเพื่อดึงข้อมูลอีกครั้ง",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(AppColors.dark[300])),
        onPressed: () {
          controller.setCovidToday();
        },
      ),
    );
  }

  Widget newDeaths() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "เสียชีวิต",
          style: TextStyle(
            color: AppColors.dark[300],
            fontSize: 12,
          ),
        ),
        Text(
          controller.covidToday.value.newDeaths,
          style: TextStyle(
            color: AppColors.red,
            fontWeight: FontWeight.bold,
            fontSize: 42,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget newRecovered() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "รักษาหาย",
          style: TextStyle(
            color: AppColors.dark[300],
            fontSize: 12,
          ),
        ),
        Text(
          controller.covidToday.value.newRecovered,
          style: TextStyle(
            color: AppColors.green,
            fontWeight: FontWeight.bold,
            fontSize: 42,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget newHospitalized() {
    return Container(
      padding: EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "เข้ารักษาตัว",
            style: TextStyle(
              color: AppColors.dark[300],
              fontSize: 12,
            ),
          ),
          Text(
            controller.covidToday.value.newHospitalized,
            style: TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 42,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget newConfirmed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ยอดผู้ติดเชื้อ",
          style: TextStyle(
            color: AppColors.dark[300],
            fontSize: 14,
          ),
        ),
        Text(
          controller.covidToday.value.newConfirmed,
          style: TextStyle(
            color: AppColors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 54,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
