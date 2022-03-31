class Settings {
  String timeformat;
  String school;
  String juristic;
  String highlat;
  // ignore: non_constant_identifier_names
  double fajr_angle;
  // ignore: non_constant_identifier_names
  double isha_angle;

  Settings.fromJsonMap(Map<String, dynamic> map)
      : timeformat = map["timeformat"],
        school = map["school"],
        juristic = map["juristic"],
        highlat = map["highlat"],
        fajr_angle = map["fajr_angle"],
        isha_angle = map["isha_angle"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeformat'] = timeformat;
    data['school'] = school;
    data['juristic'] = juristic;
    data['highlat'] = highlat;
    data['fajr_angle'] = fajr_angle;
    data['isha_angle'] = isha_angle;
    return data;
  }
}
