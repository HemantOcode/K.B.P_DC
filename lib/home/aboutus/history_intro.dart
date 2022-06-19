import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/home/events/text_styles.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:provider/provider.dart';

import '../../commanFunction/comman_functions.dart';
import 'about_provider.dart';

class HistoryAndIntro extends StatefulWidget {
  const HistoryAndIntro({Key? key}) : super(key: key);

  @override
  State<HistoryAndIntro> createState() => _HistoryAndIntroState();
}

class _HistoryAndIntroState extends State<HistoryAndIntro> {
  bool isLoading = false;
  myInit() async {
    setState(() {
      isLoading = true;
    });
    try {
      await Provider.of<AboutProvider>(context, listen: false)
          .fetchAppConfigsCommon(commonType: 'historyandintro');
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

    final String aboutData = Provider.of<AboutProvider>(context).aboutContent;
    final String collegeBannar =
        Provider.of<AboutProvider>(context).collegeBannar;
    final List<String> eduFamily =
        Provider.of<AboutProvider>(context).eduFamily;
    print(aboutData);
    print(eduFamily);
    return Scaffold(
      appBar: AppBar(title: const Text('History And Introduction')),
      drawer: const HomeScreenAppDrawer(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
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
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.all(dW * 0.05),
                    padding: EdgeInsets.all(dW * 0.05),
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About the College",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: headline4.toDouble(),
                                color: Colors.white,
                                letterSpacing: .56),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: dW * 0.025),
                              width: double.infinity,
                              alignment: Alignment.topLeft,
                              child: Text(
                                aboutData,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: headline5.toDouble(),
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: .56),
                              )),
                        ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.all(dW * 0.05),
                    padding: EdgeInsets.all(dW * 0.05),
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our Educational Family",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: headline4.toDouble(),
                                color: Colors.white,
                                letterSpacing: .68),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: dW * 0.025),
                              width: double.infinity,
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...eduFamily.map((e) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: headline5.toDouble(),
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: .56),
                                          ),
                                          Divider(
                                            color: Colors.white,
                                          )
                                        ],
                                      ))
                                ],
                              )),
                        ]),
                  )
                ],
              ),
            ),
    );
  }
}
