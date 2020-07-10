import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:esuba_mobile_app/pages/profilePage.dart';
import 'package:esuba_mobile_app/pages/user.dart';
import 'package:esuba_mobile_app/widgets/BasicDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ECMembersPage extends StatefulWidget {
  //
  ECMembersPage() : super();
  @override
  _ECMembersPageState createState() => _ECMembersPageState();
}

class _ECMembersPageState extends State<ECMembersPage> {
  Future<List<Welcome>> fetchUSer(BuildContext context) async {
    final jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/user.json');
    return welcomeFromMap(jsonString);
  }

  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        drawer: BasicDrawer(),
        appBar: AppBar(
          backgroundColor: primary,
          elevation: 0,
          centerTitle: true,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          title: Text(
            "Ec Members",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontFamily: "Bold"),
            textAlign: TextAlign.center,
          ),
        ),
        body: FutureBuilder(
            future: fetchUSer(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 0),
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              Welcome user = snapshot.data[index];
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new ProfilePage(memberDetails: {
                                                  '_id': user.id,
                                                  'tradeName': 'Woder Bar',
                                                  'brand': 'BMW',
                                                  'ownerName': 'Rudratej Singh',
                                                  'phone': user.phone,
                                                  'bloodGroub': 'O-',
                                                  'dob': '09-05-1992',
                                                  'address': user.address,
                                                  'gstin': '32POLKIJ1234W2Z2',
                                                  'email': 'a@gmail.com',
                                                  'anniversary':
                                                      '2853  Wilkinson Street, Lebanon(TN), Tennessee(37087)',
                                                })));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                    ),
                                    width: double.infinity,
                                    height: 125,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 60,
                                          height: 60,
                                          margin: EdgeInsets.only(right: 15),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                width: 3, color: secondary),
                                          ),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white60,
                                            size: 35,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  decoration: BoxDecoration(),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.75,
                                                  child: AutoSizeText(
                                                    user.name.toString(),
                                                    maxFontSize: 16,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                        color: primary,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  )),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.person_pin,
                                                    color: secondary,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  if (user.username != null)
                                                    Text(user.username,
                                                        style: TextStyle(
                                                            color: primary,
                                                            fontSize: 13,
                                                            letterSpacing: .3))
                                                  else
                                                    SizedBox()
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.phone,
                                                    color: secondary,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  if (user.phone != null)
                                                    Text(user.phone,
                                                        style: TextStyle(
                                                            color: primary,
                                                            fontSize: 13,
                                                            letterSpacing: .3))
                                                  else
                                                    SizedBox()
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            }),
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
