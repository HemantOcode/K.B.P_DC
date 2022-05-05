import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login_screen.dart';
import 'package:flutter_application_1/auth/utilites/loader_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        Duration(seconds: 1),
        (() => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false)));
  }

  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: dW * 5,
          width: dW * 8,
          child: Image.asset('assets/college-dummy.jpg'),
        ),
      ),
    );
  }
}
