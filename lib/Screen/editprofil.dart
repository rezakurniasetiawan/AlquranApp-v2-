import 'package:alquran_app/Model/members.dart';
import 'package:flutter/material.dart';

class Editprofil extends StatefulWidget {
  @override
  State<Editprofil> createState() => _EditprofilState();
}

class _EditprofilState extends State<Editprofil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text("Edit Profil"),
      ),
      body: Container(
        child: Center(
            child: Text(
          "Maintenence",
        )),
      ),
    );
  }
}
