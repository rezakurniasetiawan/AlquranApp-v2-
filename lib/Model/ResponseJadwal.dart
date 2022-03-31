import 'package:alquran_app/Model/results.dart';

class ResponseJadwal {
  int code;
  String status;
  Results results;

  ResponseJadwal.fromJsonMap(Map<String, dynamic> map)
      : code = map["code"],
        status = map["status"],
        results = Results.fromJsonMap(map["results"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['status'] = status;
    data['results'] = results == null ? null : results.toJson();
    return data;
  }
}
