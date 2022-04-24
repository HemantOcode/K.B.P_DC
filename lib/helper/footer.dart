import 'package:flutter/material.dart';
import 'package:flutter_application_1/Acadmics/Acadmics.dart';
import 'package:flutter_application_1/about/contactus.dart';
import 'package:flutter_application_1/about/infrastructure.dart';
import 'package:flutter_application_1/about/management.dart';
import 'package:flutter_application_1/about/mission.dart';
import 'package:flutter_application_1/Auth/login_screen.dart';
import 'package:flutter_application_1/about/intro.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/Acadmics/Acadmics.dart';

class footer extends StatefulWidget {
  @override
  State<footer> createState() => _footerState();
}

// ignore: camel_case_types
class _footerState extends State<footer> {
  @override
  Widget build(BuildContext context) {
    // final userDetails = Provider.of<Auth>(context).currentUser;
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 1,
      child: (SizedBox(
        child: const DecoratedBox(
            decoration: BoxDecoration(color: Color.fromARGB(255, 14, 7, 75))),
        height: 70,
        width: double.infinity,
      )),
    );
  }
}
