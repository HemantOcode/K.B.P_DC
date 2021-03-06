import 'dart:developer';
import 'package:flutter_application_1/addevent.dart';
import 'package:flutter_application_1/event.dart';
import 'package:flutter_application_1/addevent.dart';
import 'Auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/providers/auth_provider.dart';
import 'package:flutter_application_1/about/infrastructure.dart';
import 'package:flutter_application_1/about/mission.dart';
import 'package:flutter_application_1/about/intro.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/Auth/register.dart';
import 'package:provider/provider.dart';
import 'Auth/login_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'helper/local_notification.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.max,
);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint(message.notification!.body.toString());
  debugPrint(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  String? fcmToken = await FirebaseMessaging.instance.getToken();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: const MaterialApp(
        home: homepage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
