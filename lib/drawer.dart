import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/about/about.dart';
import 'package:flutter_application_1/Auth/login.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
// import 'package:flutter_application_7/authModule/auth_provider.dart';
// import 'package:flutter_application_7/authModule/login_screen.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:provider/provider.dart';
// import '../../us.dart';

class drawer extends StatefulWidget {
  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  // final storage = LocalStorage('medSearch');

  @override
  Widget build(BuildContext context) {
    // final userDetails = Provider.of<Auth>(context).currentUser;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: MultiLevelDrawer(
            header: Container(
              height: size.height * .20,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/fb.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("R")
                ],
              )),
            ),
            children: [
              MLMenuItem(
                  content: Text('Person'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_right),
                  onClick: () {},
                  subMenuItems: [
                    MLSubmenu(
                        submenuContent: Text('Option 1'),
                        onClick: () {
                          Navigator.pop(context);
                        })
                  ]),
              MLMenuItem(
                  content: Text('Person'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_right),
                  onClick: () {},
                  subMenuItems: [
                    MLSubmenu(
                        submenuContent: Text('Option 1'),
                        onClick: () {
                          Navigator.pop(context);
                        }),
                    MLSubmenu(submenuContent: Text('Option 0'), onClick: () {}),
                    MLSubmenu(submenuContent: Text('Option 2'), onClick: () {}),
                    MLSubmenu(submenuContent: Text('Option 3'), onClick: () {}),
                  ]),
            ]),
      ),
    );
  }
}
