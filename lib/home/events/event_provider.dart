import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/commanFunction/http_request.dart';
import 'package:flutter_application_1/home/events/event_modal.dart';

class EventProvider with ChangeNotifier {
  List<EventModal> events = [];

  createEvent({required Map<String, dynamic> eventBody}) async {
    try {
      final response = await postRequest(
          url: '${webApi['domain']}${endPoints['createEvent']}',
          body: eventBody);

      if (response['success']) {
        final event = response['result'];

        final eventModal = EventModal(
            id: event['_id'],
            description: event['description'],
            endDate: DateTime.parse(event['endDate']).toLocal(),
            guide: event['guide'],
            startDate: DateTime.parse(event['startDate']).toLocal(),
            title: event['title'],
            location: event['location'],
            inCampus: event['inCampus']);

        events.add(eventModal);

        notifyListeners();
      }

      return (response);
    } catch (e) {
      rethrow;
    }
  }

  fetchEvents() async {
    try {
      print('object');
      events = [];
      final response = await postRequest(
          url: '${webApi['domain']}${endPoints['fetchEvents']}', body: {});

      response['result'].forEach((event) {
        events.add(EventModal(
            id: event['_id'],
            description: event['description'],
            endDate: DateTime.parse(event['endDate']).toLocal(),
            guide: event['guide'],
            startDate: DateTime.parse(event['startDate']).toLocal(),
            title: event['title'],
            location: event['location'],
            inCampus: event['inCampus']));
      });
      notifyListeners();
      return (response);
    } catch (e) {
      rethrow;
    }
  }
}
