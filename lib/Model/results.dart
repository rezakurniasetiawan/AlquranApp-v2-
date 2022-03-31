import 'package:alquran_app/Model/datetime.dart';
import 'package:alquran_app/Model/location.dart';
import 'package:alquran_app/Model/settings.dart';

class Results {
  List<Datetime> datetime;
  Location location;
  Settings settings;

  Results.fromJsonMap(Map<String, dynamic> map)
      : datetime = List<Datetime>.from(
            map["datetime"].map((it) => Datetime.fromJsonMap(it))),
        location = Location.fromJsonMap(map["location"]),
        settings = Settings.fromJsonMap(map["settings"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] =
        datetime != null ? this.datetime.map((v) => v.toJson()).toList() : null;
    data['location'] = location == null ? null : location.toJson();
    data['settings'] = settings == null ? null : settings.toJson();
    return data;
  }
}
