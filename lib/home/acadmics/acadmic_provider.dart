import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/commanFunction/http_request.dart';

import '../../api.dart';
import 'acadmic_model.dart';

class AcadmicProvider with ChangeNotifier{
  
 List <AcadmicModal> acadmics= [];

 fetchAcadmics() async {
    try {
      print('object');
      acadmics = [];
      final response = await postRequest(
          url: '${webApi['domain']}${endPoints['fetchAcadmics']}', body: {});

      response['result'].forEach((acad) {
        acadmics.add(
          AcadmicModal(description: acad['description'] , eligibility: acad['eligibility'], name: acad['name'], objective: acad['objective'], semesters: acad['semesters'], shortForm: acad['shortForm'], totalIntake: acad['totalIntake'])
        );
      });
      notifyListeners();
      return (response);
    } catch (e) {
      rethrow;
    }
  }

 

}