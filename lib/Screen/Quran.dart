import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Quranku extends StatefulWidget {
  const Quranku({Key key}) : super(key: key);

  @override
  _QurankuState createState() => _QurankuState();
}

class _QurankuState extends State<Quranku> {
  List<SuratDetail> _list = [];
  var loading = false;
  Future<Null> _fetchData() async {
    setState(() {
      loading = true;
    });
    final String url =
        "https://al-quran-8d642.firebaseio.com/data.json?print=pretty";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(SuratDetail.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
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
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/up_header.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 300,
                        top: 70,
                        child: Text(
                          'Surah',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 76,
                                  width: double.infinity,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.only(
                                      left: 24, top: 12, bottom: 12, right: 22),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFF00695C),
                                        )
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            _list[index].nama,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            _list[index].asma,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            _list[index].arti,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ))
          ],
        ));
  }
}

class SuratDetail {
  final String arti;
  final String asma;
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
      this.ayat,
      this.nama,
      this.type,
      this.urut,
      this.nomor,
      this.rukuk,
      this.keterangan});

  factory SuratDetail.fromJson(Map<String, dynamic> json) {
    return new SuratDetail(
      arti: json['arti_ku'],
      asma: json['asma_ku'],
      ayat: json['ayat_ku'].toString(),
      nama: json['nama_ku'],
      type: json['type_ku'],
      urut: json['urut_ku'],
      nomor: json['nomor_ku'],
      rukuk: json['rukuk_ku'],
      keterangan: json['keterangan_ku'],
    );
  }
}
