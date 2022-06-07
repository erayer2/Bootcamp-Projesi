import 'package:flutter/material.dart';
import 'package:flutter_mentor_quiz_app_tut/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Müşteri memnuniyet anketi',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Program(),
    );
  }
}
