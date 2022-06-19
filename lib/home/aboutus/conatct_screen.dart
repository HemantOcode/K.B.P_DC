import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:provider/provider.dart';

import '../events/text_styles.dart';
import 'about_provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;
final String collegeAddress =
        Provider.of<AboutProvider>(context).collegeAddress;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      drawer: HomeScreenAppDrawer(),
      body: Scaffold(
          body: Column(
        children: [
           Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.all(dW * 0.05),
                    padding: EdgeInsets.all(dW * 0.05),
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: headline4.toDouble(),
                                color: Colors.white,
                                letterSpacing: .56),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: dW * 0.025),
                              width: double.infinity,
                              alignment: Alignment.topLeft,
                              child: Text(
                                collegeAddress,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: headline5.toDouble(),
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: .56),
                              )),
                        ]),
                  ),
        ],
      )),
    );
  }
}
