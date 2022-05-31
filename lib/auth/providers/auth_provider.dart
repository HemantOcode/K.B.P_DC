import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/auth/model/user_model.dart';
import 'package:flutter_application_1/commanFunction/http_request.dart';

class AuthProvider with ChangeNotifier {
  late UserModel userModel;
  late String accessToken;
  List<UserModel> students = [];
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


  fetchStudents(){


try{


   final  url = '${webApi['domain']}${endPoints['fetchStudents']}';
      final response = await postRequest(url: url, body: body);

      if (response['success']){

          
        response['result'].forEach
        ((student){

               students.add(UserModel(
                 _id:student['_id'],
                 name:student['name'],
                 gender:student['gender'],
                 role:student['role'],
                 phone:student['phone'],
                 email:student['email'],
                 std:student['std'],



               ));

        });
      notifyListeners();
      


}catch(error){


  rethrow;

}
      }



   

  }


}
