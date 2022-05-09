import 'package:flutter/material.dart';
import 'package:flutter_application_1/commanWidget/app_bar.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';

class AcadmicsScreen extends StatefulWidget {
  const AcadmicsScreen({Key? key}) : super(key: key);

  @override
  State<AcadmicsScreen> createState() => _AcadmicsScreenState();
}

class _AcadmicsScreenState extends State<AcadmicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Acadmics'),
      drawer: const HomeScreenAppDrawer(),
    );
  }
}
