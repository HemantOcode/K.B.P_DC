import 'package:flutter/material.dart';
import 'package:flutter_application_1/register.dart';
import 'drawer.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Home")),
        ),
        drawer: drawer(),
      ),
    ));
  }
}
