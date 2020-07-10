import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:esuba_mobile_app/general/showDialogSingleButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  var memberDetails;
  ProfilePage({this.memberDetails});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final primary = Color(0xff696b9e);
  bool _loading = false;
  int count = 0;
  bool images = false;
  String imageName;
  List imgList = List();
  List brands = List();
  String brand;
  int image = 0;
  String _connectionStatus;
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
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

  Widget myColoredChips(String chipName) {
    return RaisedButton(
        // color: new Color(0xffeadffd),
        child: Text(
          chipName,
          style: TextStyle(color: Colors.grey[600], fontFamily: "Bold"),
        ),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        title: Text(
          "Profile",
          style:
              TextStyle(color: Colors.white, fontSize: 24, fontFamily: "Bold"),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade300,
      body: (_connectionStatus != "ConnectivityResult.none")
          ? ModalProgressHUD(
              inAsyncCall: _loading,
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(16.0),
                                margin: EdgeInsets.only(top: 16.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 96.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          if (widget
                                                  .memberDetails['tradeName'] !=
                                              null)
                                            AutoSizeText(
                                              widget.memberDetails['tradeName'],
                                              overflow: TextOverflow.clip,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .title,
                                            )
                                          else
                                            Text(""),
                                          if (widget.memberDetails['phone'] !=
                                              null)
                                            ListTile(
                                              contentPadding: EdgeInsets.all(0),
                                              title: Text(widget
                                                  .memberDetails['ownerName']),
                                              subtitle: Text(widget
                                                  .memberDetails['phone']),
                                            )
                                          else
                                            ListTile(
                                              contentPadding: EdgeInsets.all(0),
                                              title: Text(widget
                                                  .memberDetails['ownerName']),
                                              subtitle: Text(""),
                                            ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        if (widget.memberDetails['phone'] !=
                                            null)
                                          IconButton(
                                              icon: Icon(Icons.phone),
                                              color: Colors.blue,
                                              onPressed: () async {
                                                var url =
                                                    'tel:${widget.memberDetails['phone']}';
                                                if (await canLaunch(url)) {
                                                  await launch(url,
                                                      forceSafariVC: false);
                                                } else {
                                                  throw 'Could not launch $url';
                                                }
                                              }),
                                        if (widget.memberDetails['phone'] !=
                                            null)
                                          IconButton(
                                              icon: Icon(
                                                  FontAwesomeIcons.comment),
                                              color: Colors.black,
                                              onPressed: () async {
                                                var url =
                                                    'sms:${widget.memberDetails['phone']}';
                                                if (await canLaunch(url)) {
                                                  await launch(url,
                                                      forceSafariVC: false);
                                                } else {
                                                  print(
                                                      'Could not launch $url');
                                                }
                                              }),
                                        if (widget.memberDetails['phone'] !=
                                            null)
                                          IconButton(
                                              icon: Icon(
                                                  FontAwesomeIcons.whatsapp),
                                              color: Colors.green,
                                              onPressed: () async {
                                                var whatsappUrl =
                                                    "whatsapp://send?phone=+91${widget.memberDetails['phone']}";
                                                await canLaunch(whatsappUrl)
                                                    ? launch(whatsappUrl)
                                                    : showDialogSingleButton(
                                                        context,
                                                        '',
                                                        "There is no whatsapp installed",
                                                        'Ok');
                                              }),
                                        if (widget.memberDetails['email'] !=
                                            null)
                                          IconButton(
                                              icon: Icon(
                                                  FontAwesomeIcons.envelope),
                                              color: Colors.red,
                                              onPressed: () async {
                                                var url =
                                                    'mailto:${widget.memberDetails['email']}';
                                                if (await canLaunch(url)) {
                                                  await launch(url,
                                                      forceSafariVC: false);
                                                } else {
                                                  print(
                                                      'Could not launch $url');
                                                }
                                              })
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white60,
                                  size: 55,
                                ),
                                margin: EdgeInsets.only(left: 16.0, top: 30.0),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(16.0),
                            margin: EdgeInsets.only(top: 16.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Center(
                                    child: Text(
                                      "Brands",
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black54,
                                  endIndent: 8.0,
                                  indent: 8.0,
                                ),
                                SizedBox(height: 10.0),
                                Wrap(
                                  children: <Widget>[
                                    if (brands.length == 0)
                                      Center(
                                          child: Text('No Brands...',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(fontSize: 15.5)))
                                    else
                                      for (var i = 0; i < brands.length; i++)
                                        if (i < 6)
                                          myColoredChips(brands[i].toString()),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.030),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text("User information",
                                      style:
                                          TextStyle(fontFamily: "Montserrat")),
                                ),
                                Divider(),
                                if (widget.memberDetails['email'] != null)
                                  ListTile(
                                    title: AutoSizeText("Email"),
                                    subtitle: AutoSizeText(
                                        widget.memberDetails['email'],
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontFamily: "Montserrat")),
                                    leading: Icon(Icons.email),
                                  ),
                                if (widget.memberDetails['phone'] != null)
                                  ListTile(
                                    title: AutoSizeText("Phone"),
                                    subtitle: AutoSizeText(
                                        widget.memberDetails['phone']
                                            .toString(),
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontFamily: "Montserrat")),
                                    leading: Icon(Icons.phone),
                                  ),
                                if (widget.memberDetails['gstin'] != null)
                                  ListTile(
                                    title: Text("GSTIN"),
                                    subtitle: AutoSizeText(
                                        widget.memberDetails['gstin'],
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontFamily: "Montserrat")),
                                    leading: Icon(Icons.web),
                                  ),
                                if (widget.memberDetails['bloodGroub'] != null)
                                  ListTile(
                                    title: Text("Blood Group"),
                                    subtitle: AutoSizeText(
                                        widget.memberDetails['bloodGroub'],
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontFamily: "Montserrat")),
                                    leading: Icon(FontAwesomeIcons.heartbeat),
                                  ),
                                if (widget.memberDetails['dob'] != null)
                                  ListTile(
                                    title: Text("Date Of Birth"),
                                    subtitle: AutoSizeText(
                                        widget.memberDetails['dob'],
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontFamily: "Montserrat")),
                                    leading: Icon(Icons.calendar_today),
                                  ),
                                if (widget.memberDetails['anniversary'] != null)
                                  ListTile(
                                    title: Text("Anniversary"),
                                    subtitle: AutoSizeText(
                                        widget.memberDetails['anniversary']
                                            .toString(),
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontFamily: "Montserrat")),
                                    leading: Icon(FontAwesomeIcons.userFriends),
                                  ),
                                if (widget.memberDetails['address'] != null)
                                  ListTile(
                                    title: Text("Addresss"),
                                    subtitle: AutoSizeText(
                                        widget.memberDetails['address']
                                            .toString(),
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontFamily: "Montserrat")),
                                    leading: Icon(Icons.comment),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              child: Column(children: <Widget>[
              Center(
                child: Text("No Internet Connection",
                    style: TextStyle(fontFamily: "Bold")),
              ),
              SizedBox(
                height: 4.0,
              ),
              CircularProgressIndicator(),
            ], mainAxisAlignment: MainAxisAlignment.center)),
    );
  }
}
