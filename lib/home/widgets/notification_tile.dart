import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/model/notification_model.dart';
import 'package:flutter_application_1/home/events/text_styles.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationTile({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;

    return ListTile(
      onTap: () {
          
      },
      title: Column(children: [
        Text(
          notificationModel.title,
          style: notificationTitleTextStyle,
        ),
        SizedBox(
          height: dW * 0.01,
        ),
        Text(
          notificationModel.body,
          style: notificationSubTitleTextStyle,
        ),
        SizedBox(
          height: dW * 0.02,
        ),
        Text(
          notificationModel.date.toIso8601String(),
          style: notificationSubTitleTextStyle,
        ),
      ]),
      trailing: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: notificationModel.isSeen ? Colors.transparent : Colors.blue,
        ),
        height: dW * 0.04,
        width: dW * 0.04,
      ),
    );
  }
}

final notificationTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.black,
  fontSize: headline6.toDouble(),
);

final notificationSubTitleTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: headline6.toDouble(),
    color: Colors.black38);
