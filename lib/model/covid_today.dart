
  class CovidToday {
      late int confirmed;
      late int recovered;
      late int hospitalized;
      late int deaths;
      late int newConfirmed;
      late int newRecovered;
      late int newHospitalized;
      late int newDeaths;
      late String updateDate;
      late String source;
      late String devBy;
      late String severBy;

      CovidToday({
        required this.confirmed,
        required this.recovered,
        required this.hospitalized,
        required this.deaths,
        required this.newConfirmed,
        required this.newRecovered,
        required this.newHospitalized,
        required this.newDeaths,
        required this.updateDate,
        required this.source,
        required this.devBy,
        required this.severBy,
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
        updateDate = json['UpdateDate'];
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
    }