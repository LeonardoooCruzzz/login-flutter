/*
* Author: Leonardo Cruz
* Page: Home
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageState();
  }
}

class HomePageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageStateInfo();
}

class HomePageStateInfo extends State<HomePageState> {
  
  void initState() {
    super.initState();
  }

  sair() async {
    SharedPreferences disco = await SharedPreferences.getInstance();
    await disco.setString('email', '');
    await disco.setString('senha', '');
    Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TELA INICIAL',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(225, 81, 77, 1),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(225, 81, 77, 1),
        ),
        child: Center(
          child: InkWell(
                child: Text('sair(click aqui)',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                onTap: (){
                  sair();
                },
              )
        ),
      )
    );
  }
}
