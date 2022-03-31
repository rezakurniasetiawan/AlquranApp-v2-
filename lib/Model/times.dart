class Times {
  // ignore: non_constant_identifier_names
  String Imsak;
  // ignore: non_constant_identifier_names
  String Sunrise;
  // ignore: non_constant_identifier_names
  String Fajr;
  // ignore: non_constant_identifier_names
  String Dhuhr;
  // ignore: non_constant_identifier_names
  String Asr;
  // ignore: non_constant_identifier_names
  String Sunset;
  // ignore: non_constant_identifier_names
  String Maghrib;
  // ignore: non_constant_identifier_names
  String Isha;
  // ignore: non_constant_identifier_names
  String Midnight;

  Times.fromJsonMap(Map<String, dynamic> map)
      : Imsak = map["Imsak"],
        Sunrise = map["Sunrise"],
        Fajr = map["Fajr"],
        Dhuhr = map["Dhuhr"],
        Asr = map["Asr"],
        Sunset = map["Sunset"],
        Maghrib = map["Maghrib"],
        Isha = map["Isha"],
        Midnight = map["Midnight"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Imsak'] = Imsak;
    data['Sunrise'] = Sunrise;
    data['Fajr'] = Fajr;
    data['Dhuhr'] = Dhuhr;
    data['Asr'] = Asr;
    data['Sunset'] = Sunset;
    data['Maghrib'] = Maghrib;
    data['Isha'] = Isha;
    data['Midnight'] = Midnight;
    return data;
  }
}
