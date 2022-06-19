import 'package:flutter/foundation.dart';

import '../../api.dart';
import '../../commanFunction/http_request.dart';

class AboutProvider with ChangeNotifier {
  List<String> infra = [];
  List<Map> managements = [];
  String aboutContent = '';
  List<String> eduFamily = [];
  String collegeBannar = '';
  String collegeAddress ='';
  List<String> collegePhone = [];
  String coordinates ='';

  fetchAppConfigsCommon({required String commonType}) async {
    print(commonType);
    infra = [];
    managements = [];
    eduFamily = [];
    aboutContent = '';
    try {
      final url = "${webApi['domain']}${endPoints['fetchCommonAppConfig']}";
      final response =
          await postRequest(url: url, body: {'commonType': commonType});
      print(response);
      response['result'].forEach((config) {
        if (config['type'] == 'Infrastructure') {
          infra.add(config['value']);
        }
        if (config['commonType'] == 'management') {
          managements.add({'name': config['value'], 'role': config['type']});
        }

        if (config['type'] == 'edufamily') {
          eduFamily.add(config['value']);
        }

        if (config['type'] == 'aboutData') {
          aboutContent = config['value'];
        }

        if (config['type'] == 'collegeBannar') {
          collegeBannar = config['value'];
        }

        
      });

      notifyListeners();

      return response['result'];
    } catch (e) {
      print(e);
    }
  }
}
