import 'package:flutter/material.dart';
import 'package:flutter_application_1/commanWidget/app_bar.dart';
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
      appBar: const CustomAppBar(title:'KDC ' ),
      drawer: const HomeScreenAppDrawer(),
      body: Column(
        children: [],
      ),
    );
  }
}
