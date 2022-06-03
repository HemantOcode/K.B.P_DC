import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login_screen.dart';
import 'package:flutter_application_1/auth/model/user_model.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:flutter_application_1/home/acadmics/acadmics_screen.dart';
import 'package:flutter_application_1/home/events/event_screen.dart';
import 'package:flutter_application_1/home/home_screen.dart';
import 'package:flutter_application_1/home/students/students_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class HomeScreenAppDrawer extends StatefulWidget {
  const HomeScreenAppDrawer({Key? key}) : super(key: key);

  @override
  State<HomeScreenAppDrawer> createState() => _HomeScreenAppDrawerState();
}

class _HomeScreenAppDrawerState extends State<HomeScreenAppDrawer> {
  final LocalStorage storage = new LocalStorage('KDCCOLLEGE');

  logout() async {
    storage.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }

  final List<Map<String, dynamic>> drawerOption = [
    {'name': 'Home', 'icon': 'assets/svgs/home.svg'},
    {'name': 'Events', 'icon': 'assets/svgs/event.svg'},
    {'name': 'Acadmics', 'icon': 'assets/svgs/ac.svg'},
    {'name': 'About Us', 'icon': 'assets/svgs/about.svg'},
    {'name': 'Contact Us', 'icon': 'assets/svgs/contact.svg'},
    {'name': 'Students', 'icon': 'assets/svgs/contact.svg'},
    {'name': 'Logout', 'icon': 'assets/svgs/logout.svg'},
  ];

  getNaviagtion(title) {
    switch (title) {
      case 'Home':
        pushAndRemoveUntil(context: context, widget: HomeScreen());

        break;

      case 'Events':
        pushAndRemoveUntil(context: context, widget: EventScreen());

        break;
      case 'Acadmics':
        pushAndRemoveUntil(context: context, widget: AcadmicsScreen());

        break;
      case 'About Us':
        break;
      case 'Contact Us':
        break;

      case 'Students':
        pushAndRemoveUntil(context: context, widget: StudentScreen());
        break;

      case 'Logout':
        logout();
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;
    final double ts = MediaQuery.of(context).textScaleFactor;
    final UserModel user = Provider.of<AuthProvider>(context).userModel;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                // color: Theme.of(context).primaryColor,
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(user.name), Text(user.email)],
                ),
              ],
            ),
          ),
          ...drawerOption.map(
            (option) => ListTile(
              leading: SvgPicture.asset(
                option['icon'],
                height: 25,
                width: 25,
              ),
              title: Text(option['name']!),
              onTap: () {
                getNaviagtion(option['name']);
              },
            ),
          )
        ],
      ),
    );
  }
}
