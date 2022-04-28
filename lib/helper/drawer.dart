// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Acadmics/BA.dart';
import 'package:flutter_application_1/Acadmics/Bcom.dart';
import 'package:flutter_application_1/Acadmics/baf.dart';
import 'package:flutter_application_1/Acadmics/bbi.dart';
import 'package:flutter_application_1/Acadmics/bscit.dart';
import 'package:flutter_application_1/about/contactus.dart';
import 'package:flutter_application_1/about/infrastructure.dart';
import 'package:flutter_application_1/about/management.dart';
import 'package:flutter_application_1/about/mission.dart';
import 'package:flutter_application_1/about/intro.dart';
import 'package:flutter_application_1/event.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:flutter_application_1/home.dart';
import 'package:url_launcher/url_launcher.dart';

class drawer extends StatefulWidget {
  @override
  State<drawer> createState() => _drawerState();
}

// ignore: camel_case_types
class _drawerState extends State<drawer> {
  _launchyt() async {
    const url = "https://www.youtube.com/channel/UCRRHATsTDg8pgxPseZO_o1Q";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchig() async {
    const url = "https://www.instagram.com/kbp_degree_college_thane/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchfb() async {
    const url = "https://www.facebook.com/kbpdegreecollegethane";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
              height: 18,
            ),
            SafeArea(
              child: Image.asset(
                "assets/banner.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      children: [
        MLMenuItem(
            content: Text(
              " Home",
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
            content: Text(
              "  Events",
              style: TextStyle(color: Colors.green),
            ),
            leading: Icon(
              Icons.event_available,
              color: Colors.green,
            ),
            onClick: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => event()));
            }),
        MLMenuItem(
            content: const Text(
              " Acadmics",
              style: const TextStyle(color: Colors.cyan),
            ),
            leading: const Icon(
              Icons.menu_book,
              color: Colors.cyan,
            ),
            onClick: () {},
            subMenuItems: [
              MLSubmenu(
                  submenuContent: const Text(" B.A"),
                  onClick: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Ba()));
                  }),
              MLSubmenu(
                  submenuContent: const Text("B.Sc IT"),
                  onClick: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => It()));
                  }),
              MLSubmenu(
                  submenuContent: const Text("B.COM"),
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bcom()));
                  }),
              MLSubmenu(
                  submenuContent: const Text("B.AF"),
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Baf()));
                  }),
              MLSubmenu(
                  submenuContent: const Text("B.BI"),
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bbi()));
                  })
            ]),
        MLMenuItem(
            content: const Text(
              " About Us",
              style: const TextStyle(color: Colors.white),
            ),
            leading: const Icon(
              Icons.group,
              color: Colors.white,
            ),
            onClick: () {},
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
                  submenuContent: const Text("Infrastructure"),
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => infras()));
                  })
            ]),
        MLMenuItem(
            content: const Text(
              " Contact Us",
              style: const TextStyle(color: Colors.blue),
            ),
            leading: const Icon(
              Icons.phone,
              color: Colors.blue,
            ),
            onClick: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => contus()));
            }),
        MLMenuItem(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      _launchfb();
                    },
                    icon: Icon(
                      Icons.facebook,
                      color: Colors.blue.shade600,
                    )),
                IconButton(
                    onPressed: () async {
                      _launchig();
                    },
                    icon: Icon(MdiIcons.instagram, color: Colors.white70)),
                IconButton(
                    onPressed: () {
                      _launchyt();
                    },
                    icon: Icon(
                      MdiIcons.youtube,
                      color: Colors.red,
                    )),
              ],
            ),
            leading: Align(
              alignment: Alignment.bottomCenter,
            ),
            onClick: () {})
      ],
    ));
  }
}
