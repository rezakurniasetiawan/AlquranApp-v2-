import 'dart:convert';
import 'package:alquran_app/Screen/Login.dart';
import 'package:alquran_app/main_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String nama, email, username, password;

  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    showAlertDialog(context);
    final response = await http.post(
        Uri.parse("https://alquranappreza.000webhostapp.com/api/register.php"),
        body: {
          "nama": nama,
          "email": email,
          "username": username,
          "password": password,
        });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Loginku()));
      });
      Flushbar(
        title: 'Alquran App',
        message: 'Register Successful, Please Login Now',
        duration: Duration(seconds: 5),
      ).show(context);
    } else {
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00695C),
          centerTitle: true,
          title: Text(
            "Register",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/up_header.jpg'),
                fit: BoxFit.cover,
              )),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 30.0,
                      bottom: 20.0,
                      child: Text(
                        'Created New Account',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28.0,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (e) {
                        if (e != null && e.isEmpty) {
                          return "Please insert nama";
                        }
                      },
                      onSaved: (e) => nama = e,
                      decoration: InputDecoration(
                        labelText: "Nama",
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.teal[800],
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.teal[800],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (e) {
                        if (e != null && e.isEmpty) {
                          return "Please insert username";
                        }
                      },
                      onSaved: (e) => username = e,
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.teal[800],
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.teal[800],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (e) {
                        if (e != null && e.isEmpty) {
                          return "Please insert email";
                        }
                      },
                      onSaved: (e) => email = e,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.teal[800],
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.teal[800],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (e) {
                        if (e != null && e.isEmpty) {
                          return "Please insert password";
                        }
                      },
                      obscureText: _secureText,
                      onSaved: (e) => password = e,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: showHide,
                          icon: Icon(_secureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: Colors.teal[800],
                        ),
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.teal[800],
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.teal[800],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {
                          check();
                        },
                        padding: EdgeInsets.all(0),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.teal[800],
                                Colors.teal[700],
                                Colors.teal[800],
                              ],
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            constraints: BoxConstraints(
                                maxWidth: double.infinity, minHeight: 50),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
