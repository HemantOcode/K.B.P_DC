import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/events/event_modal.dart';
import 'package:flutter_application_1/home/events/widget/add_new_event_bottom_sheet.dart';
import 'package:flutter_application_1/home/events/widget/event_details_sheet.dart';
import 'package:flutter_application_1/home/events/text_styles.dart';
import 'package:intl/intl.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({Key? key, required this.eventModal}) : super(key: key);
  final EventModal eventModal;

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;
    final ts = MediaQuery.of(context).textScaleFactor;

    return GestureDetector(
      onTap: (() => showModalBottomSheet(
          context: context,
          builder: (context) => EventDetailsSheet(
                eventModal: eventModal,
              ))),
      child: Container(
        padding: EdgeInsets.all(dW * 0.04),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2.5,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: dW * 0.04),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: dW * 0.15,
                width: dW * 0.15,
                // margin: EdgeInsets.only(right: dW * 0.02),
                // padding: EdgeInsets.all(dW * 0.02),
                child: Image.network('https://picsum.photos/200'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: dW * 0.02),
              width: dW * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventModal.title,
                    softWrap: true,
                    style: getEventHeaderTextStyle(ts: ts),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month_rounded,
                        color: Color(0xff17a1a2),
                        size: 18,
                      ),
                      Text(
                        DateFormat('dd MMM yyyy').format(eventModal.startDate),
                        softWrap: true,
                        style: getEventSubHeaderTextStyle(ts: ts),
                      ),

                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: eventTextColor,
                      //     shape: BoxShape.circle,
                      //   ),
                      //   height: dW * 0.01,
                      //   width: dW * 0.01,
                      //   margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: dW * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: eventTextColor, size: 18),
                      Container(
                        width: dW * 0.5,
                        child: Text(
                          eventModal.location,
                          softWrap: true,
                          style: getEventSubHeaderTextStyle(ts: ts),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
