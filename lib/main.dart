import 'package:alquran_app/Screen/DetaileAyat.dart';
import 'package:alquran_app/SpalshScreen.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() => runApp(MyApp());

String username = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-quran App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpashScreenku(),
    );
  }
}
