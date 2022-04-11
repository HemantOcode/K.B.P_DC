import 'package:flutter/material.dart';
import 'package:flutter_application_1/about/about.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/Auth/register.dart';
import 'Auth/login.dart';

void main() {
  runApp(KBP());
}

class KBP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: about(),
    ));
  }
}
