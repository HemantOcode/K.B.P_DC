import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/model/notification_model.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:flutter_application_1/commanWidget/app_bar.dart';
import 'package:flutter_application_1/home/widgets/notification_tile.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isLoading = false;
  myInit() async {
    setState(() {
      isLoading = true;
    });

    try {
      await Provider.of<AuthProvider>(context, listen: false)
          .fetchNotifications();
    } catch (e) {
      errorSnackbar(context, "Failed to fetch notification");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    myInit();
  }

  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;

    final List<NotificationModel> notifications =
        Provider.of<AuthProvider>(context).notifications;
    return Scaffold(
      appBar: CustomAppBar(title: "Notifications"),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                height: dW * 0.01,
              ),
              itemBuilder: ((context, index) =>
                  NotificationTile(notificationModel: notifications[index])),
              itemCount: notifications.length,
            ),
    );
  }
}
