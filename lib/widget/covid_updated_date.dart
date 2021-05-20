import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:thailand_covid_19/const/colors.dart';
import 'package:thailand_covid_19/controller/home_controller.dart';

class CovidUpdatedDate extends StatelessWidget {
  final HomeController controller;
  const CovidUpdatedDate(this.controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        controller.covidTodayController.obx(
          (state) {
            return Text(
              "ข้อมูลเมื่อ ${controller.covidToday.updateDate}",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: AppColors.dark[400],
                fontSize: 10,
              ),
            );
          },
          onEmpty: Text(
            "ไม่มีข้อมูล",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.dark[400],
              fontSize: 10,
            ),
          ),
          onLoading: Text(
            "กำลังดึงข้อมูล...",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.dark[400],
              fontSize: 10,
            ),
          ),
          onError: (error) => Text(
            "เกิดข้อผิดพลาด",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.dark[400],
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
