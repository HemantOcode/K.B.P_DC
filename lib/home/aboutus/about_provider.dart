import 'package:flutter/foundation.dart';

import '../../api.dart';
import '../../commanFunction/http_request.dart';

class AboutProvider with ChangeNotifier {
  List<String> infra = [];
  List<Map> managements = [];
  String aboutContent = '';
  List<String> eduFamily = [];
  String collegeBannar = '';
  String collegeAddress = '';
  List<String> collegePhone = [];
  String cood = '';
  String vision = '';
  String mission = '';
  List<Map<String, String>> socialMedia = [
    {
      'icon': 'https://img.icons8.com/color/48/undefined/facebook-new.png',
      'name': 'Facebook',
      'url': '',
    },
    {
      'icon': 'https://img.icons8.com/color/48/undefined/youtube-play.png',
      'name': 'Youtube',
      'url': '',
    },
    {
      'icon': 'https://img.icons8.com/fluency/48/undefined/instagram-new.png',
      'name': 'Instagram',
      'url': '',
    }
  ];

  fetchAppConfigsCommon({required String commonType}) async {
    print(commonType);
    infra = [];
    managements = [];
    eduFamily = [];
    aboutContent = '';
    collegeAddress = '';
    cood = '';
    collegePhone = [];
    vision = '';
    mission = '';
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

        if (config['type'] == 'address') {
          collegeAddress = config['value'];
        }

        if (config['type'] == 'cood') {
          cood = config['value'];
        }

        if (config['type'] == 'phone' || config['type'] == 'tel') {
          collegePhone.add(config['value']);
        }

        if (config['type'] == 'vision') {
          vision = config['value'];
        }

        if (config['type'] == 'mission') {
          mission = config['value'];
        }

        if (config['type'] == 'mission') {
          mission = config['value'];
        }

        if (config['type'] == 'Youtube') {
          socialMedia[1]['url'] = config['value'];
        }
        if (config['type'] == 'Facebook') {
          socialMedia[0]['url'] = config['value'];
        }
        if (config['type'] == 'Instagram') {
          socialMedia[2]['url'] = config['value'];
        }
      });

      notifyListeners();

      return response['result'];
    } catch (e) {
      print(e);
    }
  }
}
