import 'package:intl/intl.dart';
import 'package:thailand_covid_19/helper/date_time.dart';
import 'package:thailand_covid_19/helper/number.dart';

class CovidTimeline {
  String? updateDate;
  List<Data>? data;

  CovidTimeline({
    this.updateDate,
    this.data,
  });

  CovidTimeline.fromJson(Map<String, dynamic> json) {
    updateDate = json['UpdateDate'];
    data =
        List<dynamic>.from(json['Data']).map((e) => Data.fromJson(e)).toList();
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['UpdateDate'] = updateDate;
    _data['Data'] = data!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  String? _date;
  int? _newConfirmed;
  int? _newRecovered;
  int? _newHospitalized;
  int? _newDeaths;
  int? confirmed;
  int? recovered;
  int? hospitalized;
  int? deaths;

  Data({
    this.confirmed,
    this.recovered,
    this.hospitalized,
    this.deaths,
  });

  Data.fromJson(Map<String, dynamic> json) {
    _date = json['Date'];
    _newConfirmed = json['NewConfirmed'];
    _newRecovered = json['NewRecovered'];
    _newHospitalized = json['NewHospitalized'];
    _newDeaths = json['NewDeaths'];
    confirmed = json['Confirmed'];
    recovered = json['Recovered'];
    hospitalized = json['Hospitalized'];
    deaths = json['Deaths'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Date'] = date;
    _data['NewConfirmed'] = newConfirmed;
    _data['NewRecovered'] = newRecovered;
    _data['NewHospitalized'] = newHospitalized;
    _data['NewDeaths'] = newDeaths;
    _data['Confirmed'] = confirmed;
    _data['Recovered'] = recovered;
    _data['Hospitalized'] = hospitalized;
    _data['Deaths'] = deaths;
    return _data;
  }

  String get date {
    try {
      DateTime newDate = DateTimeHelper()
          .convertFormatDateWithBE(_date!, format: "MM/dd/yyyy");
      return DateFormat("dd MMM yy", "th").format(newDate);
    } catch (e) {
      return "";
    }
  }

  String get newConfirmed {
    if (!_newConfirmed!.isNegative) {
      return "+${formatNumber(_newConfirmed!)}";
    } else {
      return "${formatNumber(_newConfirmed!)}";
    }
  }

  String get newHospitalized {
    if (!_newHospitalized!.isNegative) {
      return "+${formatNumber(_newHospitalized!)}";
    } else {
      return "${formatNumber(_newHospitalized!)}";
    }
  }

  String get newRecovered {
    if (!_newRecovered!.isNegative) {
      return "+${formatNumber(_newRecovered!)}";
    } else {
      return "${formatNumber(_newRecovered!)}";
    }
  }

  String get newDeaths {
    if (!_newDeaths!.isNegative) {
      return "+${formatNumber(_newDeaths!)}";
    } else {
      return "${formatNumber(_newDeaths!)}";
    }
  }
}
