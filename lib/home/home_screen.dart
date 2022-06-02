import 'package:flutter/material.dart';
import 'package:flutter_application_1/commanWidget/app_bar.dart';
import 'package:flutter_application_1/home/notification_screen.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'KDC ',
        actions: [
          IconButton(
              onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: ((context) => NotificationScreen()))),
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const HomeScreenAppDrawer(),
      body: Column(
        children: [],
      ),
    );
  }
}
