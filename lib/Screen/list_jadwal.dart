import 'package:alquran_app/Model/ResponseJadwal.dart';
import 'package:alquran_app/Screen/text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListJadwal extends StatelessWidget {
  ResponseJadwal data;

  ListJadwal(this.data);

  Widget containerWaktu(String jam, String waktu) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        height: 70.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [BoxShadow(color: Color(0xFF00695C))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(waktu, style: styleListText),
            Text(jam, style: styleListText)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        containerWaktu(
            data.results.datetime[0].times.Fajr.toUpperCase(), 'Subuh'),
        containerWaktu(
            data.results.datetime[0].times.Dhuhr.toUpperCase(), 'Dzuhur'),
        containerWaktu(
            data.results.datetime[0].times.Asr.toUpperCase(), 'Ashar'),
        containerWaktu(
            data.results.datetime[0].times.Maghrib.toUpperCase(), 'Maghrib'),
        containerWaktu(
            data.results.datetime[0].times.Isha.toUpperCase(), 'Isya'),
      ],
    );
  }
}
