import 'package:flutter/material.dart';

class DComunity extends StatefulWidget {
  const DComunity({Key key}) : super(key: key);

  @override
  DComunityState createState() => DComunityState();
}

class DComunityState extends State<DComunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00695C),
        centerTitle: true,
        title: Text('Community'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Tidak ada members",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
