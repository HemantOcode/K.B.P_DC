import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/about/about.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/Auth/register.dart';
import 'Auth/login.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint(message.notification!.body.toString());
  debugPrint(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  debugPrint(fcmToken);

  runApp(const KBP());
}

class KBP extends StatefulWidget {
  const KBP({Key? key}) : super(key: key);

  @override
  State<KBP> createState() => _KBPState();
}

class _KBPState extends State<KBP> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
