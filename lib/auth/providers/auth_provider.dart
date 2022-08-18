import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/auth/model/notification_model.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:localstorage/localstorage.dart';

import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/auth/model/user_model.dart';
import 'package:flutter_application_1/commanFunction/http_request.dart';

class AuthProvider with ChangeNotifier {
  final LocalStorage storage = LocalStorage('KDCCOLLEGE');

  late UserModel userModel;
  late String accessToken;
  List<UserModel> students = [];
  List<NotificationModel> _notifications = [];

  List<String> bannerImages = [];

  Map presidentDetail = {'name': '', 'image': ''};

  Map beyondClassRoom = {'name': '', 'image': ''};

  String welcomeMessage = '';

  List<NotificationModel> get notifications {
    return [..._notifications];
  }

  registerAndLogin(
      {required Map<String, String> body, required String action}) async {
    String url = '';
    if (action == "register") {
      url = '${webApi['domain']}${endPoints['register']}';
    }

    if (action == "login") {
      url = '${webApi['domain']}${endPoints['loginuser']}';
    }
    // try {
    final response = await postRequest(url: url, body: body);
    if (response['success']) {
      accessToken = response['accessToken'];
      userModel = UserModel(
          accessToken: response['accessToken'],
          email: response['result']['email'],
          name: response['result']['name'],
          gender: response['result']['gender'] ?? '',
          role: response['result']['role'],
          phone: response['result']['phone'],
          id: response['result']['_id']);
      // print(response);
      response['result']['accessToken'] = response['accessToken'];
      storage.setItem('userDetails', json.encode(response['result']));
    }
    return response;
    // } catch (e) {
    //   rethrow;
    // }
  }

  fetchStudents() async {
    final url = '${webApi['domain']}${endPoints['fetchStudents']}';

    print(userModel);
    students = [];

    // try {
    final response =
        await postRequest(url: url, token: userModel.accessToken!, body: {});

    if (response['success']) {
      response['result'].forEach((student) {
        students.add(UserModel(
          id: student['_id'],
          name: student['name'],
          gender: student['gender'] ?? '',
          role: student['role'],
          phone: student['phone'],
          email: student['email'],
          std: student['std'] ?? '',
        ));
      });
      notifyListeners();
    }
    // } catch (e) {
    //   rethrow;
    // }
  }

  fetchNotifications() async {
    final url = '${webApi['domain']}${endPoints['fetchNotifications']}';
    _notifications = [];
    try {
      final response =
          await postRequest(url: url, body: {'user': userModel.id});

      if (response['success']) {
        response['result'].forEach((notification) {
          _notifications.add(NotificationModel(
              id: notification['_id'],
              date: DateTime.parse(notification['createdAt']).toLocal(),
              body: notification['body'] ?? '',
              title: notification['title'] ?? '',
              isSeen: notification['isSeen'] ?? false,
              featureId: notification['featureId'] ?? '',
              type: notification['type'] ?? ''));
        });
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  seenNotification(String notificationId) async {
    final url = '${webApi['domain']}${endPoints['markAsSeen']}';

    await postRequest(url: url, body: {'notificationId': notificationId});

    for (NotificationModel notification in _notifications) {
      if (notification.id == notificationId) {
        notification.isSeen = true;
        notifyListeners();
      }
      continue;
    }
  }

  setUserModel(UserModel user) {
    userModel = user;
    notifyListeners();
  }

  fetchAppConfigsCommon({required String commonType}) async {
    bannerImages = [];
    print(commonType);
    try {
      final url = "${webApi['domain']}${endPoints['fetchCommonAppConfig']}";
      final response =
          await postRequest(url: url, body: {'commonType': commonType});
      print(response);
      response['result'].forEach((config) {
        if (config['type'] == 'Banner') {
          bannerImages.add(config['value']);
        }
        if (config['type'] == 'PresidentName') {
          presidentDetail['name'] = config['value'];
        }
        if (config['type'] == 'PresidentImage') {
          presidentDetail['image'] = config['value'];
        }
        if (config['type'] == 'BC') {
          beyondClassRoom['image'] = config['value'];
        }
        if (config['type'] == 'welcomeMessage') {
          welcomeMessage = config['value'];
        }
      });

      notifyListeners();

      return response['result'];
    } catch (e) {
      print(e);
    }
  }

  getUserDetails({required String query}) async {
    try {
      final url = "${webApi['domain']}${endPoints['getUserEmailORPhone']}";

      final response = await postRequest(url: url, body: {'query': query});

     return response;
    } catch (error) {
      print(error);
    }
  }

  changeUserPassWord({required String phone, required String password}) async {
    try {
      final url = "${webApi['domain']}${endPoints['changeUserPassWord']}";
      final response = await postRequest(
          url: url, body: {'phone': phone, 'password': password});


      return response['success'];
    } catch (e) {
      rethrow;
    }
  }
}
