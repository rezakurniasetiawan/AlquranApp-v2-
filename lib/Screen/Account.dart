import 'dart:convert';

import 'package:alquran_app/Model/members.dart';
import 'package:alquran_app/Screen/dataaccount.dart';
import 'package:alquran_app/Screen/editprofil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  final VoidCallback signOut;
  Account({this.signOut});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  String id = "", username = "", nama = "", email = "", foto = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      username = preferences.getString("username");
      nama = preferences.getString("nama");
      email = preferences.getString("email");
      foto = preferences.getString("foto");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
                  width: 90,
                  child: Stack(
                    fit: StackFit.expand,
                    overflow: Overflow.visible,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -10,
                        child: SizedBox(
                          height: 43,
                          width: 43,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(color: Colors.white, width: 2),
                            ),
                            color: Colors.teal[800],
                            onPressed: () {},
                            child: Image.asset(
                              'assets/images/ic_pencil.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$nama",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Editprofil()));
                      },
                      child: Text(
                        "Edit profile",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(121, 121, 121, 1),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 2))),
            ),
            SizedBox(
              height: 10,
            ),
            ProfileMenu("Personal Data", "assets/images/ic_account2.png", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DataAccount()));
            }),
            ProfileMenu("Reset Password", "assets/images/ic_tameng.png", () {}),
            ProfileMenu(
                "Privacy & Policy", "assets/images/ic_privacy.png", () {}),
            ProfileMenu("About", "assets/images/ic_about.png", () {}),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: GestureDetector(
                onTap: () {
                  signOut();
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Color(0xFF00695C),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ProfileMenu(String title, String icon, VoidCallback press) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: press,
            child: Row(
              children: [
                Image.asset(
                  icon,
                  color: Color.fromRGBO(58, 58, 58, 1),
                  width: 22.0,
                ),
                SizedBox(width: 20),
                Expanded(
                    child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(58, 58, 58, 1),
                  ),
                )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
