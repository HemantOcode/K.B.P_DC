import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login_screen.dart';
import 'package:flutter_application_1/auth/model/user_model.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/auth/utilites/loader_widget.dart';
import 'package:flutter_application_1/home/home_screen.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalStorage storage = new LocalStorage('KDCCOLLEGE');

  myInit() async {
    await storage.ready;
    final userDetails = json.decode(storage.getItem('userDetails')??'{}');
    if (userDetails.isEmpty) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
      return;
    }

    try {
      UserModel user = UserModel(
          email: userDetails['email'],
          name: userDetails['name'],
          gender: userDetails['gender']??'',
          role: userDetails['role'],
          phone: userDetails['phone'],
          id: userDetails['_id'],
          accessToken: userDetails['accessToken'],
          
          );

      Provider.of<AuthProvider>(context, listen: false).setUserModel(user);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } catch (e) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    myInit();

    // Future.delayed(
    //     Duration(seconds: 1),
    //     (() => Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => LoginScreen()),
    //         (route) => false)));
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
