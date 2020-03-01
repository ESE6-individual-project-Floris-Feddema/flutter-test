import 'package:flutter/material.dart';
import 'package:hello_world/src/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login test',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new Scaffold(body: LoginPage(),),
    );
  }
}

