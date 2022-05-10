import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Auth/model/user_model.dart';
import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/commanFunction/http_request.dart';

class AuthProvider with ChangeNotifier {
  late UserModel userModel;
  late String accessToken;

  registerAndLogin(
      {required Map<String, String> body, required String action}) async {
    String url = '';
    if (action == "register") {
      url = '${webApi['domain']}${endPoints['register']}';
    }

    if (action == "login") {
      url = '${webApi['domain']}${endPoints['loginuser']}';
    }
    try {
      final response = await postRequest(url: url, body: body);
      accessToken = response['accessToken'];
      userModel = UserModel(
          email: response['result']['email'],
          name: response['result']['name'],
          gender: response['result']['gender'] ?? '',
          role: response['result']['role'],
          phone: response['result']['phone'],
          id: response['result']['_id']);
      print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
