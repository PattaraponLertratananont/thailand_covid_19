import 'package:get/get.dart';
import 'package:thailand_covid_19/model/covid_timeline.dart';
import 'package:thailand_covid_19/model/covid_today.dart';
import 'package:thailand_covid_19/service/covid.dart';

class HomeController {
  CovidTodayController covidTodayController = CovidTodayController();
  CovidToday get covidToday => covidTodayController.covidToday.value;
  Future<void> setCovidToday() => covidTodayController.setCovidToday();

  CovidTimelineController covidTimelineController = CovidTimelineController();
  CovidTimeline get covidTimeline =>
      covidTimelineController.covidTimeline.value;
  Future<void> setCovidTimeline() => covidTimelineController.setCovidTimeline();
  List<Data> get getTimelineData => covidTimelineController.getTimelineData;
}

class CovidTodayController extends GetxController with StateMixin<CovidToday> {
  Rx<CovidToday> covidToday = CovidToday().obs;

  Future<void> setCovidToday() async {
    try {
      change(covidToday.value, status: RxStatus.loading());
      CovidToday? data = await CovidService().fetchDataToday();
      if (data != null) {
        covidToday.value = data;
        change(covidToday.value, status: RxStatus.success());
      } else {
        change(covidToday.value, status: RxStatus.empty());
      }
    } catch (e) {
      change(covidToday.value, status: RxStatus.error());
    }
  }
}

class CovidTimelineController extends GetxController
    with StateMixin<CovidTimeline> {
  Rx<CovidTimeline> covidTimeline = CovidTimeline().obs;

  Future<void> setCovidTimeline() async {
    try {
      change(covidTimeline.value, status: RxStatus.loading());
      CovidTimeline? data = await CovidService().fetchDataTimeline();
      if (data != null) {
        print(data.data![500].toJson());
        covidTimeline.value = data;
        covidTimeline.value.data!.removeLast();
        covidTimeline.value.data = covidTimeline.value.data!.reversed.toList();
        change(covidTimeline.value, status: RxStatus.success());
      } else {
        change(covidTimeline.value, status: RxStatus.empty());
      }
    } catch (e) {
      change(covidTimeline.value, status: RxStatus.error());
    }
  }

  List<Data> get getTimelineData => covidTimeline.value.data!;
}
