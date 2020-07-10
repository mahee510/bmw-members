import 'package:flutter/material.dart';

class ConfigModel {
  final String authToken;

  ConfigModel(this.authToken);

  ConfigModel.fromJson(Map<String, dynamic> json) : authToken = json['token'];
}

ThemeData buildTheme() {
  return ThemeData(
    fontFamily: "Montserrat",
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.redAccent[50],
  );
}