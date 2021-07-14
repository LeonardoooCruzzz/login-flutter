/*
* Author: Leonardo Cruz
* Page: Home
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPageState();
  }
}

class LoginPageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginPageInfo();
}

class LoginPageInfo extends State<LoginPageState> {
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController btnController =RoundedLoadingButtonController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  bool manterConectado = false, visible = false;
  int rolagem = 0;

  manterconectado() async {
    SharedPreferences disco = await SharedPreferences.getInstance();
    if(disco.getString('email') != '' && disco.getString('senha') != '') {
      Navigator.pushNamed(context, '/home');
    }
  }

  validar() async {
    if(email.text.isNotEmpty && senha.text.isNotEmpty) {
      if(manterConectado == true) {
        SharedPreferences disco = await SharedPreferences.getInstance();
        await disco.setString('email', email.text);
        await disco.setString('senha', senha.text);
      }
      btnController.success();
      Timer(Duration(seconds: 1), () {
        Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
      });
    } else {
      btnController.error();
      Timer(Duration(seconds: 1), () {
        btnController.reset();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      manterconectado();
    });
    
    Timer(Duration(seconds: 3), () {
      setState(() {
        rolagem = 70;
        visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'L',
                              style: TextStyle(fontSize: 80,color: Color.fromRGBO(225, 81, 77, 1),fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'c',
                                    style: TextStyle(color: Color.fromRGBO(87, 106, 86, 1),fontWeight: FontWeight.bold))
                                ],
                          )
                        )
                      )
                    ),
                    Positioned(
                      bottom: 50,
                      left: 0,
                      child: AnimatedOpacity(
                        opacity: (visible == true) ? 1 : 0,
                        duration: Duration(seconds: 1),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                          child: Icon(
                            Icons.arrow_circle_up_rounded,
                            color: Color.fromRGBO(87, 106, 86, 1),
                            size: 30.0,
                          ),
                        ),
                      ),
                      )
                    ),
                    ListView(
                      children: [
                        AnimatedContainer(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - rolagem),
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0)),
                            color: Color.fromRGBO(225, 81, 77, 1),
                          ),
                          duration: Duration(seconds: 1),
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Preencha os campos abaixo\ncom suas credenciais.\n\n',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.white),textAlign: TextAlign.center,),
                                Container(
                                  child: TextFormField(
                                    controller: email,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'E-mail',
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Color.fromRGBO(225, 81, 77, 1),
                                        size: 24.0,
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: 13,
                                          color:
                                              Color.fromRGBO(118, 118, 118, 1)),
                                      contentPadding: EdgeInsets.only(
                                          left: 10,
                                          right: 20,
                                          top: 15,
                                          bottom: 15),
                                      border: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  child: TextFormField(
                                    controller: senha,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Senha',
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Color.fromRGBO(225, 81, 77, 1),
                                        size: 24.0,
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: 13,
                                          color:
                                              Color.fromRGBO(118, 118, 118, 1)),
                                      contentPadding: EdgeInsets.only(
                                          left: 10,
                                          right: 20,
                                          top: 15,
                                          bottom: 15),
                                      border: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      checkColor: Color.fromRGBO(225, 81, 77, 1),
                                      activeColor: Colors.white,
                                      value: manterConectado,
                                      onChanged: (value) {
                                        setState(() {
                                          manterConectado = value;
                                        });
                                      },
                                    ),
                                    Text('manter logado',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white)),
                                  ],
                                )),
                                Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: RoundedLoadingButton(
                                          color: Color.fromRGBO(87, 106, 86, 1),
                                          successColor: Color.fromRGBO(87, 106, 86, 1),
                                          controller: btnController,
                                          onPressed: () => validar(),
                                          valueColor: Colors.white,
                                          borderRadius: 10,
                                          elevation: 0,
                                          child: Text('LOGAR',style: TextStyle(fontSize: 14,color: Colors.white),),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
