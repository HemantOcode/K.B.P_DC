import 'package:flutter/material.dart';
import 'package:flutter_application_1/about/about.dart';
import 'package:flutter_application_1/Auth/login.dart';
import 'package:flutter_application_1/about/intro.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:flutter_application_1/home.dart';
// import 'package:flutter_application_7/authModule/auth_provider.dart';
// import 'package:flutter_application_7/authModule/login_screen.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:provider/provider.dart';
// import '../../us.dart';

class drawer extends StatefulWidget {
  @override
  State<drawer> createState() => _drawerState();
}

// ignore: camel_case_types
class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    // final userDetails = Provider.of<Auth>(context).currentUser;
    Size size = MediaQuery.of(context).size;
    return (MultiLevelDrawer(
      backgroundColor: Color.fromARGB(255, 14, 7, 72),
      header: Center(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            SafeArea(
              child: Image.asset(
                "assets/banner.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 2,
            )
          ],
        ),
      ),
      children: [
        MLMenuItem(
            content: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onClick: () {
              const homepage();
            }),
        MLMenuItem(
            content: Text(
              "About Us",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.group,
              color: Colors.white,
            ),
            onClick: () {
              return (about());
            },
            subMenuItems: [
              MLSubmenu(
                  submenuContent: Text("History / Introduction"),
                  onClick: () {}),
              MLSubmenu(
                  submenuContent: Text("Vision & Mission"), onClick: () {}),
              MLSubmenu(submenuContent: Text("Managment"), onClick: () {}),
              MLSubmenu(
                  submenuContent: Text("College Development Committee"),
                  onClick: () {}),
              MLSubmenu(submenuContent: Text("Infrastructure"), onClick: () {})
            ]),
        MLMenuItem(
            content: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onClick: () {
              const homepage();
            }),
        MLMenuItem(
            content: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onClick: () {
              const homepage();
            }),
        MLMenuItem(
            content: Text(
              "Contact US",
              style: TextStyle(color: Colors.green),
            ),
            leading: Icon(
              Icons.phone,
              color: Colors.green,
            ),
            onClick: () {
              return (intro());
            }),
      ],
    ));
  }
}
