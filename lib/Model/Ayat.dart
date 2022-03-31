class Ayat {
  String ar;
  String id;
  String nomor;

  Ayat({this.ar, this.id, this.nomor});

  factory Ayat.fromJson(Map<String, dynamic> object) {
    return Ayat(
        ar: object['ar'].toString(),
        id: object['id'],
        nomor: object['nomor'].toString());
  }
}
