class Date {
  int timestamp;
  String gregorian;
  String hijri;

  Date.fromJsonMap(Map<String, dynamic> map)
      : timestamp = map["timestamp"],
        gregorian = map["gregorian"],
        hijri = map["hijri"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = timestamp;
    data['gregorian'] = gregorian;
    data['hijri'] = hijri;
    return data;
  }
}
