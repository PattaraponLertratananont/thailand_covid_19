import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thailand_covid_19/const/colors.dart';
import 'package:thailand_covid_19/const/enum.dart';
import 'package:thailand_covid_19/controller/home_controller.dart';
import 'package:thailand_covid_19/widget/covid_updated_date.dart';
import 'package:thailand_covid_19/widget/number_stat.dart';

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
    controller.setCovidTimeline();
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
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                          NumberStat(
                            controller: controller,
                            label: "ยอดผู้ติดเชื้อ",
                            size: NumberSize.big,
                            textColor: AppColors.yellow,
                            alignment: CrossAxisAlignment.start,
                            type: CovidType.confirmed,
                          ),
                          NumberStat(
                            controller: controller,
                            label: "เข้ารักษาตัว",
                            textColor: AppColors.blue,
                            alignment: CrossAxisAlignment.end,
                            type: CovidType.hospitalized,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          NumberStat(
                            controller: controller,
                            label: "รักษาหาย",
                            size: NumberSize.big,
                            textColor: AppColors.green,
                            alignment: CrossAxisAlignment.start,
                            type: CovidType.recovered,
                          ),
                          NumberStat(
                            controller: controller,
                            label: "เสียชีวิต",
                            textColor: AppColors.red,
                            alignment: CrossAxisAlignment.end,
                            type: CovidType.deaths,
                          ),
                        ],
                      ),
                    ),
                    CovidUpdatedDate(controller),
                  ],
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
                child: controller.covidTodayController.obx(
                  (state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
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
                                    controller.covidToday.confirmed,
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
                                    controller.covidToday.hospitalized,
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
                                    controller.covidToday.recovered,
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
                                    controller.covidToday.deaths,
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
              SizedBox(height: 24),
              Container(
                width: Get.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.dark[600],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        titleCard("สถานการณ์ COVID-19 ย้อนหลัง"),
                        InkWell(
                          child: Text(
                            "ดูเพิ่มเติม",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.dark[300],
                            ),
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                    controller.covidTimelineController.obx(
                      (state) {
                        return Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 16),
                            physics: ClampingScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return covidTimeline(index);
                            },
                          ),
                        );
                      },
                      onEmpty: cardEmpty(),
                      onError: (error) => cardError(),
                      onLoading: cardLoading(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget covidTimeline(int index) {
    return Container(
      padding: EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${controller.getTimelineData[index].date} - ",
            style: TextStyle(
              color: AppColors.dark[300],
              fontSize: 12,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "ผู้ติดเชื้อ ",
                          style: TextStyle(
                            color: AppColors.dark[300],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          controller.getTimelineData[index].newConfirmed,
                          style: TextStyle(
                            color: AppColors.yellow,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "เข้ารักษา ",
                          style: TextStyle(
                            color: AppColors.dark[300],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          controller.getTimelineData[index].newHospitalized,
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "รักษาหาย ",
                          style: TextStyle(
                            color: AppColors.dark[300],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          controller.getTimelineData[index].newRecovered,
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "เสียชีวิต ",
                          style: TextStyle(
                            color: AppColors.dark[300],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          controller.getTimelineData[index].newDeaths,
                          style: TextStyle(
                            color: AppColors.red,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget titleCard(String title) {
    return Expanded(
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.white,
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
}
