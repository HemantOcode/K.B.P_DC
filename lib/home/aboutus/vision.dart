import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/home/aboutus/about_provider.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:provider/provider.dart';

import '../../commanFunction/comman_functions.dart';
import '../events/text_styles.dart';

class MissionAndVision extends StatefulWidget {
  const MissionAndVision({Key? key}) : super(key: key);

  @override
  State<MissionAndVision> createState() => _MissionAndVisionState();
}

class _MissionAndVisionState extends State<MissionAndVision> {
  bool isLoading = false;
  myInit() async {
    setState(() {
      isLoading = true;
    });
    try {
      await Provider.of<AboutProvider>(context, listen: false)
          .fetchAppConfigsCommon(commonType: 'missionandvision');
    } catch (e) {
      errorSnackbar(context, e.toString());
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
    final String vision = Provider.of<AboutProvider>(context).vision;
    final String mission = Provider.of<AboutProvider>(context).mission;
    final collegeBannar = Provider.of<AboutProvider>(context).collegeBannar;

    return Scaffold(
      appBar: AppBar(title: Text("Mission and Vision")),
      drawer: HomeScreenAppDrawer(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage.assetNetwork(
                      fit: BoxFit.fill,
                      placeholder: 'assets/png/placeholder.webp',
                      image: collegeBannar),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.all(dW * 0.05),
                padding: EdgeInsets.all(dW * 0.05),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Mission",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: headline4.toDouble(),
                          color: Colors.white,
                          letterSpacing: .56),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: dW * 0.05),
                        height: dW * 0.1,
                        width: dW * 0.1,
                        child: Image.asset('assets/mission.png')),
                    Container(
                      width: double.infinity,
                      child: Text(
                        mission,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: headline4.toDouble(),
                            color: Colors.white,
                            letterSpacing: .56),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.all(dW * 0.05),
                padding: EdgeInsets.all(dW * 0.05),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Vision",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: headline4.toDouble(),
                          color: Colors.white,
                          letterSpacing: .56),
                    ),
                    SizedBox(
                        height: dW * 0.1,
                        width: dW * 0.1,
                        child: Image.asset('assets/vision.png')),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        vision,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: headline4.toDouble(),
                            color: Colors.white,
                            letterSpacing: .56),
                      ),
                    )
                  ],
                ),
              )
            ]),
    );
  }
}
