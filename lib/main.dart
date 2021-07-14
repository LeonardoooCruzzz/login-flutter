/*
* Author: Leonardo Cruz
* */
import 'package:flutter/material.dart';
import 'package:login/routes/routes.dart';

void main() => runApp(App());
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorDark: Colors.black,
        accentColor: Colors.blue
      ),
      initialRoute: '/',
      onGenerateRoute: Routes(),
    );
  }
}