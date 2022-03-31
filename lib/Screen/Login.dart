import 'package:alquran_app/main_screen.dart';
import 'package:alquran_app/register.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Loginku extends StatefulWidget {
  const Loginku({Key key}) : super(key: key);

  @override
  _LoginkuState createState() => _LoginkuState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginkuState extends State<Loginku> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;

  String username, password;
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
      login();
    }
  }

  login() async {
    showAlertDialog(context);
    final response = await http.post(
        Uri.parse("https://alquranappreza.000webhostapp.com/api/login.php"),
        body: {
          "username": username,
          "password": password,
        });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String idAPI = data['id'];
    String namaAPI = data['nama'];
    String usernameAPI = data['username'];
    String passwordAPI = data['password'];
    String emailAPI = data['email'];
    String bioAPI = data['bio'];
    String hakaksesAPI = data['hakakses'];
    String fotoAPI = data['foto'];
    if (value == 1) {
      setState(
        () {
          _loginStatus = LoginStatus.signIn;
          savePref(value, idAPI, namaAPI, usernameAPI, passwordAPI, emailAPI,
              bioAPI, hakaksesAPI, fotoAPI);
          Navigator.pop(context);
        },
      );
      Flushbar(
        title: 'Alquran App',
        message: 'Login Successful',
        duration: Duration(seconds: 5),
      ).show(context);
    } else {
      print(pesan);
      Navigator.pop(context);
      Flushbar(
        title: 'Alquran App',
        message: 'Please check again. your username or password is wrong.',
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }

  savePref(int value, String id, String nama, String username, String password,
      String email, String bio, String hakakses, String foto) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("id", id);
      preferences.setString("nama", nama);
      preferences.setString("username", username);
      preferences.setString("password", password);
      preferences.setString("email", email);
      preferences.setString("bio", bio);
      preferences.setString("hakakses", hakakses);
      preferences.setString("foto", foto);
      // ignore: deprecated_member_use
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", 0);
      // ignore: deprecated_member_use
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
      print("Logout Berhasil");
      Flushbar(
        title: 'Alquran App',
        message: 'Logout Successful.',
        duration: Duration(seconds: 5),
      ).show(context);
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.50,
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
                          'Login',
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
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    Form(
                      key: _key,
                      child: Column(
                        children: <Widget>[
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
                            height: 16,
                          ),
                          TextFormField(
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
                            height: 16,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
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
                                    "Login",
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
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'You dont have an account? ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Register',
                                    style: TextStyle(
                                        color: Colors.teal[800],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
        // ignore: dead_code
        break;
      case LoginStatus.signIn:
        return MainScreen(signOut: signOut);
        // ignore: dead_code
        break;
    }
  }
}
