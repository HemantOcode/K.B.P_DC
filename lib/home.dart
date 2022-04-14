import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/register.dart';
import 'drawer.dart';
import 'about/intro.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 7, 75),
          title: Center(child: Text("Home")),
        ),
        drawer: drawer(),
      ),
    ));
  }
}
