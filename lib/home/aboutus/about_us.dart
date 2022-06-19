import 'package:flutter/material.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:flutter_application_1/home/aboutus/conatct_screen.dart';
import 'package:flutter_application_1/home/aboutus/history_intro.dart';
import 'package:flutter_application_1/home/aboutus/infra_screen.dart';
import 'package:flutter_application_1/home/aboutus/management.dart';
import 'package:flutter_application_1/home/aboutus/vision.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final List<Map<String, String>> _aboutUs = [
    {
      'icon':
          "https://img.icons8.com/external-inipagistudio-lineal-color-inipagistudio/64/undefined/external-history-book-store-inipagistudio-lineal-color-inipagistudio.png",
      'name': 'History and Introduction'
    },
    {
      'icon':
          'https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/undefined/external-mission-success-flatart-icons-lineal-color-flatarticons-1.png',
      'name': 'Mission and Vision'
    },
    {
      'icon':
          'https://img.icons8.com/external-flatart-icons-outline-flatarticons/64/undefined/external-infrastructure-information-technology-flatart-icons-outline-flatarticons.png',
      'name': 'Infrastructure'
    },
    {
      'icon':
          'https://img.icons8.com/ios/50/undefined/commercial-development-management.png',
      'name': 'Management'
    },
    {
      'icon':
          'https://img.icons8.com/external-phatplus-lineal-phatplus/64/undefined/external-support-authentication-phatplus-lineal-phatplus.png',
      'name': 'Contact Us'
    },
  ];

  getNavigation(String value) {
    switch (value) {
      case 'About Us':
        break;

      case 'History and Introduction':
        pushAndRemoveUntil(context: context, widget: const HistoryAndIntro());
        break;

      case 'Mission and Vision':
        pushAndRemoveUntil(context: context, widget: const MissionAndVision());
        break;

      case 'Infrastructure':
        pushAndRemoveUntil(
            context: context, widget: const InfraStructureScreen());
        break;

      case 'Management':
        pushAndRemoveUntil(context: context, widget: const ManagementScreen());
        break;

      case 'Contact Us':
        pushAndRemoveUntil(context: context, widget: const ContactScreen());

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Divider(color: Colors.transparent, height: 10),
          ..._aboutUs.map(
            (e) => ListTile(
              style: ListTileStyle.drawer,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 0.2),
                // borderRadius: BorderRadius.circular(5),
              ),
              onTap: () {
                getNavigation(e['name']!);
              },
              minLeadingWidth: 10,
              leading: SizedBox(
                  height: dW * 0.06,
                  width: dW * 0.06,
                  child: Image.network(
                    e['icon']!,
                    color: Colors.blue,
                  )),
              title: Text(e['name']!),
            ),
          ),
        ],
      ),
    );
  }
}
