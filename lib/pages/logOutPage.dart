import 'package:esuba_mobile_app/general/showDialogSingleButton.dart';
import 'package:flutter/material.dart';

class Fillters {
  static const String Logout = 'Logout';

  static const List<String> choices = <String>[
    Logout,
  ];
}

class Logout extends StatefulWidget {
  Logout({Key key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  void choicesAction(String choices) {
    showLoaderButton(context, "Please Wait....");
    if (choices == Fillters.Logout) {
      setState(() {
        Navigator.of(context).pushReplacementNamed('/login');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onSelected: choicesAction,
      itemBuilder: (BuildContext context) {
        return Fillters.choices.map((String choices) {
          return PopupMenuItem<String>(
            value: choices,
            child: Text(
              choices,
              style: TextStyle(fontFamily: "Montserrat", color: Colors.black),
            ),
          );
        }).toList();
      },
    );
  }
}
