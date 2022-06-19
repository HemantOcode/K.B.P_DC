import 'package:flutter/material.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:flutter_application_1/home/events/event_modal.dart';
import 'package:flutter_application_1/home/events/text_styles.dart';
import 'package:intl/intl.dart';

class EventDetailsSheet extends StatelessWidget {
  const EventDetailsSheet({Key? key, required this.eventModal})
      : super(key: key);
  final EventModal eventModal;

  @override
  Widget build(BuildContext context) {
    final ts = MediaQuery.of(context).textScaleFactor;
    final dW = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(dW * 0.04),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Text(
        //   'Event Details',
        //   style: getEventHeaderTextStyle(ts: ts),
        // ),
        Text(
          eventModal.title,
          style: getEventHeaderTextStyle(ts: ts),
        ),
        SizedBox(
          height: dW * 0.02,
        ),

        Text(
          eventModal.description,
          // 'This is importent this we can fo  most of the time their is nor oprinnHoe to do this thisg ans',
          style: getEventSubHeaderTextStyle(ts: ts),
        ),
        SizedBox(
          height: dW * 0.04,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Event Begin',
              // 'This is importent this we can fo  most of the time their is nor oprinnHoe to do this thisg ans',
              style: getEventSubHeaderBoldTextStyle(ts: ts),
            ),
            Text(
              'Event Over',
              // 'This is importent this we can fo  most of the time their is nor oprinnHoe to do this thisg ans',
              style: getEventSubHeaderBoldTextStyle(ts: ts),
            ),
          ],
        ),
        SizedBox(
          height: dW * 0.01,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('dd MMM yyyy hh:mm a').format(eventModal.startDate),
              // 'This is importent this we can fo  most of the time their is nor oprinnHoe to do this thisg ans',
              style: getEventSubHeaderTextStyle(ts: ts),
            ),
            Text(
              DateFormat('dd MMM yyyy hh:mm a').format(eventModal.endDate),
              // 'This is importent this we can fo  most of the time their is nor oprinnHoe to do this thisg ans',
              style: getEventSubHeaderTextStyle(ts: ts),
            ),
          ],
        ),
        SizedBox(
          height: dW * 0.04,
        ),
        Text(
          'Duration',
          // 'This is importent this we can fo  most of the time their is nor oprinnHoe to do this thisg ans',
          style: getEventSubHeaderBoldTextStyle(ts: ts),
        ),

        Text(
          // DateFormat('dd MMM yyyy hh:mm a').format(eventModal.startDate),
          differnceBetweenTwoDates(eventModal.endDate, eventModal.startDate),
          // 'This is importent this we can fo  most of the time their is nor oprinnHoe to do this thisg ans',
          style: getEventSubHeaderTextStyle(ts: ts),
        ),

        SizedBox(
          height: dW * 0.04,
        ),
        Text(
          'Spokeperson',
          // 'This is importent this we can fo  most of the time their is nor oprinnHoe to do this thisg ans',
          style: getEventSubHeaderBoldTextStyle(ts: ts),
        ),

        Text(
          // DateFormat('dd MMM yyyy hh:mm a').format(eventModal.startDate),
          eventModal.guide,
          // 'This is importent this we can fo  most of the time their is nor oprinnHoe to do this thisg ans',
          style: getEventSubHeaderTextStyle(ts: ts),
        ),
      ]),
    );
  }
}
