import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:thailand_covid_19/const/colors.dart';
import 'package:thailand_covid_19/controller/home_controller.dart';

class NumberStat extends StatelessWidget {
  final HomeController controller;
  final String label;
  final Color textColor;
  final NumberSize? size = NumberSize.small;
  final CrossAxisAlignment alignment;
  final StatType type;
  const NumberStat({
    Key? key,
    required this.controller,
    required this.label,
    required this.textColor,
    size,
    required this.alignment,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.dark[300],
            fontSize: 12,
          ),
        ),
        controller.covidTodayController.obx(
          (state) {
            return Text(
              typeStat(type),
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize(size),
                height: 1.2,
              ),
            );
          },
          onEmpty: Text(
            "0",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize(size),
              height: 1.2,
            ),
          ),
          onLoading: Text(
            "0",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize(size),
              height: 1.2,
            ),
          ),
          onError: (error) => Text(
            "Error",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize(size),
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  String typeStat(StatType type) {
    switch (type) {
      case StatType.confirmed:
        return controller.covidToday.newConfirmed;
      case StatType.hospitalized:
        return controller.covidToday.newHospitalized;
      case StatType.recovered:
        return controller.covidToday.newRecovered;
      case StatType.deaths:
        return controller.covidToday.newDeaths;
      default:
        return "";
    }
  }

  double fontSize(NumberSize? size) => size == NumberSize.big ? 54 : 42;
}

enum NumberSize {
  big,
  small,
}

enum StatType {
  confirmed,
  hospitalized,
  recovered,
  deaths,
}
