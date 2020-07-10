import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rich_alert/rich_alert.dart';

void showDialogSingleButton(BuildContext context, String title, String message, [String buttonLabel]) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        title: new Text(title, style: TextStyle(fontFamily: "Montserrat",),),
        content: new Text(message, style: TextStyle(fontFamily: "Montserrat",),),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: buttonLabel == null ? null : new Text(buttonLabel, style: TextStyle(fontFamily: "Montserrat", color: Colors.blue),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void showDialogValidationButton(BuildContext context, String title, String message, [String buttonLabel]) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        title: new Text(title, style: TextStyle(fontFamily: "Montserrat",),),
        content: new Text(message, style: TextStyle(fontFamily: "Montserrat",),),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: buttonLabel == null ? null : new Text(buttonLabel, style: TextStyle(fontFamily: "Montserrat",),),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      );
    },
  );
}
void showDialogCheckIn(BuildContext context, String message, [String buttonLabel]) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Icon(FontAwesomeIcons.exclamationCircle, color: Colors.yellow,size: 70.0,),
        content: new Text(message, style: TextStyle(fontFamily: "Montserrat",),),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: buttonLabel == null ? null : new Text(buttonLabel, style: TextStyle(fontFamily: "Montserrat",),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showDialogLocate(BuildContext context, String title, String message, [String buttonLabel]) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        title: new Text(title, style: TextStyle(fontFamily: "Montserrat",),),
        content: new Text(message, style: TextStyle(fontFamily: "Montserrat",),),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: buttonLabel == null ? null : new Text(buttonLabel, style: TextStyle(fontFamily: "Montserrat",color: Colors.blue),),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/locate');
            },
          ),
        ],
      );
    },
  );
}


void showRichDialog(BuildContext context, String title, String message, int type) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return RichAlertDialog(
        alertTitle: Text(title, style: TextStyle(fontFamily: "Montserrat",),),
        alertSubtitle: Text(message, style: TextStyle(fontFamily: "Montserrat",),),
        alertType: type,
      );
    },
  );
}

void showLoaderButton(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return new WillPopScope(
        onWillPop: () async => true,
        child: SimpleDialog(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
            backgroundColor: Colors.white,
            children: <Widget>[
              Center(
                child: Column(children: [
                  CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),),
                  SizedBox(height: 10,),
                  Text(message,style: TextStyle(color: Colors.black),)
                ]),
              )
            ]
          )
        );
      }
  );
}