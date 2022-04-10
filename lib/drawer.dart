import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/about.dart';
import 'package:flutter_application_1/login.dart';
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
    return Drawer(
      child: ListView(
        children: <Widget>[
          // UserAccountsDrawerHeader(
          //   accountName:
          //    Text(userDetails['name'],
          //     style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.w700,
          //         letterSpacing: 1.2),
          //   ),
          //   accountEmail: Text(userDetails['email'],
          //       style: TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.w500,
          //           letterSpacing: 1.2)),
          // ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => about()));
            },
            child: const ListTile(
              title: Text("About US"),
              leading: Icon(Icons.group),
            ),
          ),
          InkWell(
            onTap: () async {
              // await storage.deleteItem('med-user');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                  (route) => false);
            },
            child: const ListTile(
              title: Text("Log-Out"),
              leading: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
    );
  }
}
