//flutter packages
import 'package:esuba_mobile_app/pages/profilePage.dart';
import 'package:esuba_mobile_app/pages/searchPage.dart';
import 'package:flutter/material.dart';

//imported packages
import 'package:esuba_mobile_app/pages/loginpage.dart';
import 'package:esuba_mobile_app/pages/homepage.dart';
import 'package:esuba_mobile_app/asset/config.dart';

import 'pages/ecMembers.dart';
import 'widgets/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var _appPage = 'login';

  //run app
  runApp(new MaterialApp(
    title: 'BMW',
    debugShowCheckedModeBanner: false,
    theme: buildTheme(),
    home: _appPage == "login" ? ImageSplashScreen() : HomePage(),
    routes: <String, WidgetBuilder>{
      //set routes for using the navigator
      '/splash': (BuildContext context) => new ImageSplashScreen(),
      '/home': (BuildContext context) => new HomePage(),
      '/login': (BuildContext context) => new LoginPage(),
      '/search': (BuildContext context) => new SearchPage(),
      '/profile': (BuildContext context) => new ProfilePage(),
      '/ecMembers': (BuildContext context) => new ECMembersPage(),
    },
  ));
}
