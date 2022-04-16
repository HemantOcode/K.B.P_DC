import 'package:flutter/material.dart';
import 'package:flutter_application_1/about/contactus.dart';
import 'package:flutter_application_1/about/management.dart';
import 'package:flutter_application_1/about/mission.dart';
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
      backgroundColor: const Color.fromARGB(255, 14, 7, 72),
      header: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            SafeArea(
              child: Image.asset(
                "assets/banner.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 2,
            )
          ],
        ),
      ),
      children: [
        MLMenuItem(
            content: Text(
              "Home",
              style: TextStyle(color: Colors.orange.shade100),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.orange.shade100,
            ),
            onClick: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => homepage()));
            }),
        MLMenuItem(
            content: const Text(
              "Acadmics",
              style: const TextStyle(color: Colors.cyan),
            ),
            leading: const Icon(
              Icons.menu_book,
              color: Colors.cyan,
            ),
            onClick: () {
              const homepage();
            }),
        MLMenuItem(
            content: const Text(
              "About Us",
              style: const TextStyle(color: Colors.white),
            ),
            leading: const Icon(
              Icons.group,
              color: Colors.white,
            ),
            onClick: () {
              return (const login());
            },
            subMenuItems: [
              MLSubmenu(
                  submenuContent: const Text("History / Introduction"),
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => intro()));
                  }),
              MLSubmenu(
                  submenuContent: const Text("Vision & Mission"),
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => miss_Visi()));
                  }),
              MLSubmenu(
                  submenuContent: const Text("Managment"),
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => management()));
                  }),
              MLSubmenu(
                  submenuContent: const Text("Development Committee"),
                  onClick: () {}),
              MLSubmenu(
                  submenuContent: const Text("Infrastructure"), onClick: () {})
            ]),
        MLMenuItem(
            content: const Text(
              "Contact US",
              style: const TextStyle(color: Colors.green),
            ),
            leading: const Icon(
              Icons.phone,
              color: Colors.green,
            ),
            onClick: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => contus()));
            }),
      ],
    ));
  }
}
