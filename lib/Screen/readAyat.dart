import 'package:flutter/material.dart';

class ReadAyat extends StatelessWidget {
  final arti;
  final asma;
  final ayat;
  final nama;
  final type;
  final urut;
  final nomor;
  final rukuk;
  final keterangan;

  ReadAyat(
      {this.arti,
      this.asma,
      this.ayat,
      this.nama,
      this.type,
      this.urut,
      this.nomor,
      this.rukuk,
      this.keterangan});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00695C),
        centerTitle: true,
        title: Text(
          "Al-Qur'an",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
