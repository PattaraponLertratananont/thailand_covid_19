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
                            Expanded(
                              child: Text(
                                "สถานการณ์ COVID-19 ณ วันที่ ${controller.covidToday.value.updateDate}",
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
                      Container(
                        margin: EdgeInsets.only(top: 16),
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
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            newRecovered(),
                            newDeaths(),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                onEmpty: newCovidEmpty(),
                onError: (error) => newCovidError(),
                onLoading: newCovidLoading(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center newCovidEmpty() {
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

  Center newCovidLoading() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.dark[400],
        color: AppColors.white,
      ),
    );
  }

  Center newCovidError() {
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
            height: 1.4,
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
            height: 1.4,
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
