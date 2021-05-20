class CovidToday {
  int? confirmed;
  int? recovered;
  int? hospitalized;
  int? deaths;
  int? newConfirmed;
  int? newRecovered;
  int? newHospitalized;
  int? newDeaths;
  String? _updateDate;
  String? source;
  String? devBy;
  String? severBy;

  CovidToday({
    this.confirmed,
    this.recovered,
    this.hospitalized,
    this.deaths,
    this.newConfirmed,
    this.newRecovered,
    this.newHospitalized,
    this.newDeaths,
    this.source,
    this.devBy,
    this.severBy,
  });

  CovidToday.fromJson(Map<String, dynamic> json) {
    confirmed = json['Confirmed'];
    recovered = json['Recovered'];
    hospitalized = json['Hospitalized'];
    deaths = json['Deaths'];
    newConfirmed = json['NewConfirmed'];
    newRecovered = json['NewRecovered'];
    newHospitalized = json['NewHospitalized'];
    newDeaths = json['NewDeaths'];
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
  String get updateDate => DateTime.parse(_updateDate!).toString();
}