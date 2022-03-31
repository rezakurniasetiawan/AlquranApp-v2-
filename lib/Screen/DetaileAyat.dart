import 'package:alquran_app/Model/Ayat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetaileAyat extends StatefulWidget {
  final String ar;
  final String id;
  final String nomor;

  DetaileAyat({Key key, this.ar, this.id, this.nomor}) : super(key: key);

  @override
  _DetaileAyatState createState() => _DetaileAyatState();
}

class _DetaileAyatState extends State<DetaileAyat> {
  List<Ayat> _list = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    final String url = "https://api.npoint.io/99c279bb173a6e28359c/surat/";
    final response = await http.get(Uri.parse(url + widget.nomor));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Ayat.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00695C),
          centerTitle: true,
          title: Text(
            "Surah " + widget.ar,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 125,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/up_header.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
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
                              Container(
                                color: (index % 2 == 1)
                                    ? Colors.white
                                    : Colors.grey[100],
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 16,
                                    right: 16,
                                    bottom: 16,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 32,
                                        margin: EdgeInsets.only(right: 16),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF00695C),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8))),
                                        child: Center(
                                          child: Text(
                                            (index + 1).toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              child: Text(
                                                _list[index].ar,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: Text(
                                                _list[index].id,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF00695C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
