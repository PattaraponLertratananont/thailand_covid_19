import 'package:intl/intl.dart';
import 'package:thailand_covid_19/helper/date_time.dart';

class CovidToday {
  int? _confirmed;
  int? _recovered;
  int? _hospitalized;
  int? _deaths;
  int? _newConfirmed;
  int? _newRecovered;
  int? _newHospitalized;
  int? _newDeaths;
  String? _updateDate;
  String? source;
  String? devBy;
  String? severBy;

  CovidToday({
    this.source,
    this.devBy,
    this.severBy,
  });

  CovidToday.fromJson(Map<String, dynamic> json) {
    _confirmed = json['Confirmed'];
    _recovered = json['Recovered'];
    _hospitalized = json['Hospitalized'];
    _deaths = json['Deaths'];
    _newConfirmed = json['NewConfirmed'];
    _newRecovered = json['NewRecovered'];
    _newHospitalized = json['NewHospitalized'];
    _newDeaths = json['NewDeaths'];
    _updateDate = json['UpdateDate'];
    source = json['Source'];
    devBy = json['DevBy'];
    severBy = json['SeverBy'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Confirmed'] = confirmed;
    _data['Recovered'] = recovered;
    _data['Hospitalized'] = hospitalized;
    _data['Deaths'] = deaths;
    _data['NewConfirmed'] = newConfirmed;
    _data['NewRecovered'] = newRecovered;
    _data['NewHospitalized'] = newHospitalized;
    _data['NewDeaths'] = newDeaths;
    _data['UpdateDate'] = updateDate;
    _data['Source'] = source;
    _data['DevDy'] = devBy;
    _data['SeverBy'] = severBy;
    return _data;
  }

  String get updateDate {
    DateTime newDate = DateTimeHelper().convertFormatDateWithBE(_updateDate!);
    return DateFormat("dd MMM yyyy เวลา HH:mm น.", "th").format(newDate);
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

  String get confirmed {
    return "${formatNumber(_confirmed!)}";
  }

  String get hospitalized {
    return "${formatNumber(_hospitalized!)}";
  }

  String get recovered {
    return "${formatNumber(_recovered!)}";
  }

  String get deaths {
    return "${formatNumber(_deaths!)}";
  }

  String formatNumber(int number) {
    return NumberFormat("#,###").format(number);
  }
}
