import 'package:flutter/material.dart';
import 'dart:convert';

class AsmaulHusna extends StatefulWidget {
  const AsmaulHusna({Key key}) : super(key: key);

  @override
  _AsmaulHusnaState createState() => _AsmaulHusnaState();
}

class _AsmaulHusnaState extends State<AsmaulHusna> {
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
            "Asmaul Husna",
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
                        left: 200,
                        top: 70,
                        child: Text(
                          'Asmaul Husna',
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
                        .loadString("jsonfiles/asmaulhusna.json"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var showData = json.decode(snapshot.data.toString());
                        return ListView.builder(
                          itemCount: showData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: double.infinity,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.only(
                                      left: 24, top: 12, bottom: 12, right: 22),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF00695C),
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
                                            showData[index]['latin'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            showData[index]['arab'],
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10)),
                                          Text(
                                            showData[index]['arti'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
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
