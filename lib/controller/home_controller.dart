import 'package:get/get.dart';
import 'package:thailand_covid_19/model/covid_today.dart';
import 'package:thailand_covid_19/service/covid.dart';

class HomeController extends GetxController with StateMixin<CovidToday> {
  Rx<CovidToday> covidToday = CovidToday().obs;

  Future<void> setCovidToday() async {
    change(covidToday.value, status: RxStatus.loading());
    CovidToday? data = await CovidService().fetchDataToday();
    if (data != null) {
      covidToday.value = data;
      change(covidToday.value, status: RxStatus.success());
    } else {
      change(covidToday.value, status: RxStatus.empty());
    }
  }
}
