import 'package:alquran_app/Model/ResponseJadwal.dart';
import 'package:alquran_app/Screen/header_content.dart';
import 'package:alquran_app/Screen/list_jadwal.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JadwalSholat extends StatefulWidget {
  const JadwalSholat({Key key}) : super(key: key);

  @override
  _JadwalSholatState createState() => _JadwalSholatState();
}

class _JadwalSholatState extends State<JadwalSholat> {
  TextEditingController _locationController = TextEditingController();

  Future<ResponseJadwal> getJadwal({String location}) async {
    String url =
        // ignore: unnecessary_brace_in_string_interps
        'https://api.pray.zone/v2/times/today.json?city=${location}&school=9';
    final response = await http.get(url);
    final jsonResponse = json.decode(response.body);
    return ResponseJadwal.fromJsonMap(jsonResponse);
  }

  @override
  void initState() {
    if (_locationController.text.isEmpty || _locationController.text == null) {
      _locationController.text = 'Surabaya';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final header = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width - 170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 6.0,
                    offset: Offset(0.0, 2.0),
                    color: Colors.black26)
              ],
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/up_header.jpg'))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Tooltip(
                message: 'Ubah Lokasi',
                child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.location_on),
                    onPressed: () {
                      _showDialogEditLocation(context);
                    }),
              ),
            ],
          ),
        ),
        FutureBuilder(
            future: getJadwal(
                location: _locationController.text.toLowerCase().toString()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return HeaderContent(snapshot.data);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Data Tidak Tersedia',
                          style: TextStyle(color: Colors.white),
                        )));
              }
              return Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()),
              );
            })
      ],
    );

    final body = Expanded(
        child: FutureBuilder(
            future: getJadwal(
                location: _locationController.text.toLowerCase().toString()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListJadwal(snapshot.data);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text('Data Tidak Tersedia'));
              }

              return Center(child: CircularProgressIndicator());
            }));

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
        children: <Widget>[header, body],
      ),
    );
  }

  void _showDialogEditLocation(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Ubah Lokasi'),
            content: TextField(
              controller: _locationController,
              decoration: InputDecoration(hintText: 'Lokasi'),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text('Batal'),
              ),
              // ignore: deprecated_member_use
              new FlatButton(
                onPressed: () {
                  Navigator.pop(context, () {
                    setState(() {
                      getJadwal(
                          location: _locationController.text
                              .toLowerCase()
                              .toString());
                    });
                  });
                },
                child: new Text('Ok'),
              ),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          );
        });
  }
}
