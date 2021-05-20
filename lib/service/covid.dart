import 'package:dio/dio.dart';
import 'package:thailand_covid_19/model/covid_today.dart';

class CovidService {
  Future<CovidToday?> fetchDataToday() async {
    try {
      Response res =
          await Dio().get("https://covid19.th-stat.com/api/open/today");
      return CovidToday.fromJson(res.data);
    } catch (e) {
      print("fetchDataToday: $e");
      return null;
    }
  }
}