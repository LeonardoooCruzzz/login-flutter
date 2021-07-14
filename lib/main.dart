/*
* Author: Leonardo Cruz
* */
import 'package:flutter/material.dart';
import 'package:login/pages/login.dart';
import 'package:login/pages/home.dart';

void main() => runApp(App());
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      }
    );
  }
}