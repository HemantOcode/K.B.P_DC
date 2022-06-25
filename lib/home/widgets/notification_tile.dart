import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/model/notification_model.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/home/events/event_screen.dart';
import 'package:flutter_application_1/home/events/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationTile({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;

    return ListTile(
      onTap: () {
        Provider.of<AuthProvider>(context, listen: false)
            .seenNotification(notificationModel.id);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EventScreen()));
      },
      leading: Container(
          padding: EdgeInsets.all(dW * 0.025),
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(dW)),
          child: Image.asset('assets/png/event.png')),
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: dW * 0.6,
          child: Text(
            notificationModel.title,
            style: notificationTitleTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: dW * 0.01,
        ),
        Container(
          width: dW * 0.6,
          child: Text(
            notificationModel.body,
            style: notificationSubTitleTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: dW * 0.02,
        ),
        Text(
          DateFormat('dd MMM yyyy hh:mm a').format(notificationModel.date),
          style: notificationSubTitleTextStyle,
        ),
      ]),
      trailing: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: notificationModel.isSeen ? Colors.transparent : Colors.blue,
        ),
        height: dW * 0.02,
        width: dW * 0.02,
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
