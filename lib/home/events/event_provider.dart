import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/home/events/event_modal.dart';

class EventProvider with ChangeNotifier {
  List<EventModal> events = [
    EventModal(
        description: "This Event is for It students according",
        duration: Duration(hours: 2),
        endDate: DateTime.now(),
        guide: "Aryan Murty",
        startDate: DateTime.now(),
        title: 'Hackatron',
        inCampus: false,
        location: 'Sai Baba Temple thane W (400604)'),
    EventModal(
        description: "This Event is for It students according",
        duration: Duration(hours: 2),
        endDate: DateTime.now(),
        guide: "Aryan Murty",
        startDate: DateTime.now(),
        title: 'Hackatron',
        inCampus: true,
        location: 'Sai Baba Temple thane W (400604)'),
    EventModal(
        description: "This Event is for It students according",
        duration: Duration(hours: 2),
        endDate: DateTime.now(),
        guide: "Aryan Murty",
        startDate: DateTime.now(),
        title: 'Hackatron',
        inCampus: false,
        location: 'Sai Baba Temple thane W (400604)'),
    EventModal(
        description: "This Event is for It students according",
        duration: Duration(hours: 2),
        endDate: DateTime.now(),
        guide: "Aryan Murty",
        startDate: DateTime.now(),
        title: 'Hackatron',
        inCampus: false,
        location: 'Sai Baba Temple thane W (400604)'),
  ];
}
