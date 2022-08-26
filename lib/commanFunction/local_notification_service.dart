import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map<dynamic, dynamic> localNotificationIds = {};

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(
      BuildContext context, Function handleNotificationData) {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = const IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitialize,
      iOS: iOSInitialize,
    );
    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) =>
            handleNotificationData(json.decode(payload!)));
  }

  static void display(RemoteMessage message) async {
    try {
      String title = message.notification!.title!;
      var bigTextStyleInformation = BigTextStyleInformation(
        "<p style=\"color:red\">This is a paragraph.</p>",
        htmlFormatTitle: true,
        htmlFormatBigText: true,
      );
      print(bigTextStyleInformation.bigText);
      print(message);
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails("KBP", "KBP channel",
            color: Colors.red,
            importance: Importance.high,
            priority: Priority.high,
            ongoing: true,
            styleInformation: bigTextStyleInformation,
            maxProgress: 10,
            progress: 0,

            // channelShowBadge: false,
            // fullScreenIntent: true,
            // usesChronometer: true,
            colorized: true),
        iOS: IOSNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: json.encode(message.data),
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
