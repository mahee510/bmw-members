import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:esuba_mobile_app/general/showDialogSingleButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../general/showDialogSingleButton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool buttonEnabled = false;
  String varPhone = '';
  String varPass = '';

  String _connectionStatus;
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _connectionStatus = result.toString();
      });
    });
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        if (result == ConnectivityResult.none) {
          // showDialogSingleButton(context, 'No Internet Connection','Please Turn On Your WiFi Or Mobile Data', "OK");
        }
      });
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 45.0),
                            child: Center(
                              child: Image.asset("assets/images/icon.png",
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height * 0.37,
                                  width:
                                      MediaQuery.of(context).size.width * 0.70),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                style: TextStyle(fontFamily: "Montserrat", letterSpacing: 0.9),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                onChanged: (String value) {},
                cursorColor: Colors.indigo,
                decoration: InputDecoration(
                    hintText: "User Id",
                    hintStyle: TextStyle(
                      fontFamily: "Montserrat",
                    ),
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        FontAwesomeIcons.idBadge,
                        color: Colors.indigo,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                style: TextStyle(fontFamily: "Montserrat", letterSpacing: 1.0),
                obscureText: true,
                controller: passwordController,
                cursorColor: Colors.indigo,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontFamily: "Montserrat",
                    ),
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: Colors.indigo,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          if (_connectionStatus != "ConnectivityResult.none")
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.indigo.shade500),
                  child: FlatButton(
                    child: _isLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.white))
                        : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                    onPressed: () async {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        if (emailController.text == 'a@gmail.com' &&
                            passwordController.text == 'a') {
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          showDialogSingleButton(
                              context,
                              "Email and Password are incorrect",
                              'Please Enter the valid email or password');
                        }
                      } else {
                        showDialogSingleButton(
                            context,
                            "Email and Password are incorrect",
                            'Please Enter the valid email or password');
                      }
                    },
                  ),
                ))
          else
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.indigo.shade500),
                  child: FlatButton(
                    child: _isLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.white))
                        : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                    onPressed: () {
                      showDialogSingleButton(context, 'No Internet Connection',
                          'Please Turn On Your WiFi Or Mobile Data', "OK");
                    },
                  ),
                )),
        ]));
  }
}
