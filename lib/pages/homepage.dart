import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:esuba_mobile_app/general/sizeConfig.dart';
import 'package:esuba_mobile_app/widgets/BasicDrawer.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  final TextStyle dropdownMenuItem = TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  bool _loading = false;
  
  String imageName;
  String _connectionStatus;
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  List imgList = List();
  bool images = false;
  int image =0;
  @override
  void initState() { 
    super.initState();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result){
      setState(() {
        _connectionStatus = result.toString();
      });
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  
  Future<void> _refresh() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      drawer: BasicDrawer(),
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        centerTitle: true, 
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        title: Text("BMW", style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: "Bold", letterSpacing: 1.0), textAlign: TextAlign.center,),
      ),
      body: (_connectionStatus != "ConnectivityResult.none") 
      ? ModalProgressHUD(
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            color: primary,
            onRefresh: _refresh,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  new Expanded(
                    flex: 0,
                    child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              height: 300.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset('assets/images/icon.png')
                            ),
                          ],
                        ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.012,),
                  Expanded(
                    flex: 0,
                    child: Column(children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("President", style: TextStyle(fontFamily: "Bold", fontSize: 20.0, color: const Color(0xffcc0000)),),
                        ],
                      ),
                      new SizedBox(height: MediaQuery.of(context).size.height * 0.009,),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Center(
                              child:  AutoSizeText(
                                'Vikram Pawah',
                                maxFontSize: 15,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15),
                                )
                              )
                          )
                        ],
                      ),
                      new SizedBox(height: MediaQuery.of(context).size.height * 0.020,),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Vice President", style: TextStyle(fontFamily: "Bold", fontSize: 20.0, color: const Color(0xffcc0000)),),
                          Text("Secretary", style: TextStyle(fontFamily: "Bold", fontSize: 20.0, color: const Color(0xffcc0000)),),
                        ],
                      ),
                      new SizedBox(height: MediaQuery.of(context).size.height * 0.009,),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(),
                            // width: MediaQuery.of(context).size.width * 0.50,
                            child:Center(
                              child: AutoSizeText(
                                'Rudratej Singh',
                                maxFontSize: 15,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15),
                                )
                              )
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            // width: MediaQuery.of(context).size.width * 0.45,
                            child: Center(
                              child:  AutoSizeText(
                                'Vikram Pawah',
                                maxFontSize: 15,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15),
                                )
                              )
                          ),
                        ],
                      ),
                      new SizedBox(height: MediaQuery.of(context).size.height * 0.020,),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Treasurer", style: TextStyle(fontFamily: "Bold", fontSize: 20.0, color: const Color(0xffcc0000)),),
                          Text("Joint Secretary", style: TextStyle(fontFamily: "Bold", fontSize: 20.0, color: const Color(0xffcc0000)),),
                        ],
                      ),
                      new SizedBox(height: 5.0,),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(),
                            // width: MediaQuery.of(context).size.width * 0.45,
                            child:Center(
                              child: AutoSizeText(
                                'Vikram Pawah',
                                maxFontSize: 15,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15),
                                )
                              )
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            // width: MediaQuery.of(context).size.width * 0.45,
                            child:Center(
                              child: AutoSizeText(
                                'Rudratej Singh',
                                maxFontSize: 15,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15),
                                )
                              )
                          )
                        ],
                      ),
                        ]
                    )
                  ),
                ],
              )
            )
         ), inAsyncCall: _loading,
        )
      : Container(
        child: Column(
          children: <Widget>[ 
            Center(
              child: Text("No Internet Connection", style: TextStyle(fontFamily: "Bold")),
            ),
            SizedBox(height: 4.0,),
            CircularProgressIndicator(),
          ],
          mainAxisAlignment: MainAxisAlignment.center
        )
      ),
    );
  }
}