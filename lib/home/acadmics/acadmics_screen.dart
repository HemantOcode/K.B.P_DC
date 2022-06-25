import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/commanWidget/app_bar.dart';
import 'package:flutter_application_1/home/acadmics/acadmic_detail_screen.dart';
import 'package:flutter_application_1/home/acadmics/acadmic_provider.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AcadmicsScreen extends StatefulWidget {
  const AcadmicsScreen({Key? key}) : super(key: key);

  @override
  State<AcadmicsScreen> createState() => _AcadmicsScreenState();
}

class _AcadmicsScreenState extends State<AcadmicsScreen> {
  bool isLoading = false;

  myInit() async {
    setState(() {
      isLoading = true;
    });

    try {
      await Provider.of<AcadmicProvider>(context, listen: false)
          .fetchAcadmics();
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    print("object hello");
    myInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;
    final acadList = Provider.of<AcadmicProvider>(context).acadmics;

    return Scaffold(
      appBar: CustomAppBar(title: 'Acadmics'),
      drawer: HomeScreenAppDrawer(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              separatorBuilder: ((context, index) => SizedBox(
                    height: dW * 0.025,
                  )),
              padding: EdgeInsets.symmetric(
                  horizontal: dW * 0.02, vertical: dW * 0.02),
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  // enabled: true,
                  minLeadingWidth: 10,
                  leading: SizedBox(
                      height: dW * 0.05,
                      width: dW * 0.05,
                      child: Image.network(
                        acadList[index].image,
                        fit: BoxFit.fill,
                      )),
                  title: Text(
                    acadList[index].name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AcadmicDetailScreen(
                              acadmicModal: acadList[index]))),
                ),
              ),
              itemCount: acadList.length,
            ),
    );
  }
}
