import 'package:esuba_mobile_app/general/showDialogSingleButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasicDrawer extends StatefulWidget {
  @override
  _BasicDrawerState createState() => _BasicDrawerState();
}

class _BasicDrawerState extends State<BasicDrawer> {
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title, String route) {
    final TextStyle tStyle =
        TextStyle(color: active, fontFamily: "Montserrat", fontSize: 16.0);
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(route);
        },
        child: Container(
          decoration: BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(children: [
            Icon(
              icon,
              color: active,
            ),
            SizedBox(width: 10.0),
            Text(
              title,
              style: tStyle,
            ),
            Spacer(),
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {
                        setState(
                            () => showLoaderButton(context, 'Please Wait...'));
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                    ),
                  ),
                  Container(
                    height: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.deepOrange])),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      child: Image.asset('assets/images/icon.png'),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.home, "Home", '/home'),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Members", '/search'),
                  _buildDivider(),
                  _buildRow(
                      FontAwesomeIcons.userFriends, "EC Members", '/ecMembers'),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "About", ''),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
