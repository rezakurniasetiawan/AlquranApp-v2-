import 'package:flutter/material.dart';
import 'dart:convert';

class DoaSeharihari extends StatefulWidget {
  const DoaSeharihari({Key key}) : super(key: key);

  @override
  _DoaSeharihariState createState() => _DoaSeharihariState();
}

class _DoaSeharihariState extends State<DoaSeharihari> {
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
            "Doa Sehari-Hari",
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
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 270,
                        top: 70,
                        child: Text(
                          'Doa Doa',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
                child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString("jsonfiles/doadoa.json"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var showData = json.decode(snapshot.data.toString());
                        return ListView.builder(
                          itemCount: showData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 5,
                              color: Color(0xFF00695C),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Text(
                                        showData[index]['id'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.only(bottom: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8, bottom: 10),
                                            child: Text(
                                              showData[index]['judul'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Text(
                                              showData[index]['arab'],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Text(
                                              showData[index]['arti'],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    }))
          ],
        ));
  }
}
