/*
* Controle de rotas
* Author: Leonardo Cruz
* */
import 'package:flutter/material.dart';
import '../pages/login.dart';
import '../pages/home.dart';


RouteFactory Routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;
    Widget screen;
    switch (settings.name) {
      case '/':
        screen = LoginPage();
        break;
      case '/home':
        screen = HomePage();
        break;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}