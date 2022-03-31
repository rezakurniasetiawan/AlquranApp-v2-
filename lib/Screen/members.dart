import 'dart:convert';
import 'package:alquran_app/Model/members.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Members extends StatefulWidget {
  const Members({Key key}) : super(key: key);

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  var loading = false;
  List<Membersku> list = [];
  getContent() async {
    setState(() {
      loading = true;
    });
    list.clear();
    final response = await http
        .get("https://alquranappreza.000webhostapp.com/api/getmembers.php");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        for (Map i in data) {
          list.add(Membersku.fromJson(i));
        }
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> onRefresh() async {
    getContent();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContent();
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
          "New Members",
          style: TextStyle(
            color: Colors.teal[800],
          ),
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, i) {
                  final a = list[i];
                  return Container(
                    margin: EdgeInsets.only(
                        left: 16, right: 16, bottom: 10, top: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.only(left: 16),
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.teal[800], width: 1),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset('assets/images/users.png',
                                        fit: BoxFit.contain),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "${a.nama}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
