import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Map<dynamic, dynamic> localNotificationIds = {};

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(
      BuildContext context, Function handleNotificationData) {
    var androidInitialize =
         const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = const  IOSInitializationSettings(
        // requestSoundPermission: false,
        // requestBadgePermission: false,
        // requestAlertPermission: false,
        // onDidReceiveLocalNotification: (
        //     int id,
        //     String? title,
        //     String? body,
        //     String? payload,
        //   ) async {
        //     didReceiveLocalNotificationSubject.add(
        //       ReceivedNotification(
        //         id: id,
        //         title: title,
        //         body: body,
        //         payload: payload,
        //       ),
        //     );
        //   }
        );
    final InitializationSettings initializationSettings =
        new InitializationSettings(
      android: androidInitialize,
      iOS: iOSInitialize,
    );
    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) =>
            handleNotificationData(json.decode(payload!)));
  }

  static void display(RemoteMessage message) async {
    //
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "recycleRewardsUser",
          "recycleRewardsUser channel",
          importance: Importance.max,
          priority: Priority.high,
        ),
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
