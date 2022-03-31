class SuratDetail {
  final String arti;
  final String asma;
  final String audio;
  final String ayat;
  final String nama;
  final String type;
  final String urut;
  final String nomor;
  final String rukuk;
  final String keterangan;

  SuratDetail(
      {this.arti,
      this.asma,
      this.audio,
      this.ayat,
      this.nama,
      this.type,
      this.urut,
      this.nomor,
      this.rukuk,
      this.keterangan});

  factory SuratDetail.fromJson(Map<String, dynamic> json) {
    return new SuratDetail(
      arti: json['arti'],
      asma: json['asma'],
      audio: json['audio'],
      ayat: json['ayat'].toString(),
      nama: json['nama'],
      type: json['type'],
      urut: json['urut'],
      nomor: json['nomor'],
      rukuk: json['rukuk'],
      keterangan: json['keterangan'],
    );
  }
}
