import 'package:flutter/material.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:flutter_application_1/home/acadmics/acadmics_screen.dart';
import 'package:flutter_application_1/home/events/event_screen.dart';
import 'package:flutter_application_1/home/home_screen.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenAppDrawer extends StatefulWidget {
  const HomeScreenAppDrawer({Key? key}) : super(key: key);

  @override
  State<HomeScreenAppDrawer> createState() => _HomeScreenAppDrawerState();
}

class _HomeScreenAppDrawerState extends State<HomeScreenAppDrawer> {
  final List<Map<String, dynamic>> drawerOption = [
    {'name': 'Home', 'icon': 'assets/svgs/home.svg'},
    {'name': 'Events', 'icon': 'assets/svgs/event.svg'},
    {'name': 'Acadmics', 'icon': 'assets/svgs/ac.svg'},
    {'name': 'About Us', 'icon': 'assets/svgs/about.svg'},
    {'name': 'Contact Us', 'icon': 'assets/svgs/contact.svg'},
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

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;
    final double ts = MediaQuery.of(context).textScaleFactor;
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
                const CircleAvatar(
                    // color: Theme.of(context).primaryColor,
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Abhinav yadav'),
                    Text('abhinav@gmail.com')
                  ],
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
