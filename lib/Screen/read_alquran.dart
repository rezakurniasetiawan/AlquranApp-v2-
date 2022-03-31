import 'package:alquran_app/Model/surat.dart';
import 'package:alquran_app/Screen/DetaileAyat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReadAlquran extends StatefulWidget {
  const ReadAlquran({Key key}) : super(key: key);

  @override
  _ReadAlquranState createState() => _ReadAlquranState();
}

class _ReadAlquranState extends State<ReadAlquran> {
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
          iconTheme: IconThemeData(
            color: Colors.teal[800],
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Al-Qur'an",
            style: TextStyle(
              color: Colors.teal[800],
            ),
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
                        fit: BoxFit.cover),
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetaileAyat(
                                      nomor: _list[index].nomor,
                                      ar: _list[index].nama,
                                    ),
                                  ),
                                );
                              },
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
                    ),
            )
          ],
        ));
  }
}
