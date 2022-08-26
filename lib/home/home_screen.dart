import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/commanWidget/app_bar.dart';
import 'package:flutter_application_1/home/events/event_screen.dart';
import 'package:flutter_application_1/home/events/text_styles.dart';
import 'package:flutter_application_1/home/notification_screen.dart';
import 'package:flutter_application_1/home/widgets/banner_carousel.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import '../commanFunction/local_notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocalStorage storage = LocalStorage('KDCCOLLEGE');

  bool isLoading = false;

  setUpNotificationFunctions() async {
    try {
      LocalNotificationService.initialize(context, handleNotificationClick);
      FirebaseMessaging.onMessage.listen((event) {
        LocalNotificationService.display(event);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        LocalNotificationService.display(event);
      });

      FirebaseMessaging.onBackgroundMessage(
          (message) => handleNotificationClick(message));
    } catch (e) {
      debugPrint('Errorrrrrrrrrrrrrrrrrrrrrrr');
      debugPrint(e.toString());
      debugPrint('Errorrrrrrrrrrrrrrrrrrrrrrr');
    }
    await awaitStorageReady();
  }

  awaitStorageReady() async {
    await storage.ready;
  }

  String? notificationId;

  handleNotificationClick(data) async {
    print(data);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EventScreen()));
  }

  myInit() async {
    await setUpNotificationFunctions();
    setState(() {
      isLoading = true;
    });

    try {
      await Provider.of<AuthProvider>(context, listen: false)
          .fetchAppConfigsCommon(commonType: 'home');
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
    myInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dH = MediaQuery.of(context).size.height;
    final dW = MediaQuery.of(context).size.width;
    final List<String> bannerImages =
        Provider.of<AuthProvider>(context).bannerImages;
    final presidentDetail = Provider.of<AuthProvider>(context).presidentDetail;
    final bc = Provider.of<AuthProvider>(context).beyondClassRoom;
    final welcomeMessage = Provider.of<AuthProvider>(context).welcomeMessage;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'KDC ',
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => NotificationScreen()))),
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const HomeScreenAppDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: dW * 0.05,
                  ),
                  BannerCarousel(
                      deviceHeight: dH, deviceWidth: dW, images: bannerImages),
                  SizedBox(
                    height: dW * 0.05,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(dW * 0.02),
                    margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.white,
                                    letterSpacing: 1,
                                    decorationStyle:
                                        TextDecorationStyle.dashed),
                          ),
                          SizedBox(
                            height: dW * 0.025,
                          ),
                          Text(
                            welcomeMessage,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Colors.white, letterSpacing: 1),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: dW * 0.05,
                  ),
                  HomeImageWidgets(
                    dW: dW,
                    image: bc['image'],
                    footer: '',
                    title: 'Beyond Classrooms',
                  ),
                  SizedBox(
                    height: dW * 0.05,
                  ),
                  HomeImageWidgets(
                    dW: dW,
                    image: presidentDetail['image'],
                    footer: presidentDetail['name'],
                    title: 'Governing Council',
                  ),
                ],
              ),
            ),
    );
  }
}

class HomeImageWidgets extends StatelessWidget {
  const HomeImageWidgets(
      {Key? key,
      required this.dW,
      required this.image,
      required this.footer,
      required this.title})
      : super(key: key);

  final double dW;
  final String image;
  final String title;
  final String footer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(dW * 0.02),
      margin: EdgeInsets.symmetric(
        horizontal: dW * 0.05,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                  letterSpacing: 1,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            SizedBox(
              height: dW * 0.04,
            ),
            SizedBox(
                height: dW * 0.45,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage.assetNetwork(
                      fit: BoxFit.fill,
                      placeholder: 'assets/png/placeholder.webp',
                      image: image),
                )),
            footer == ''
                ? const SizedBox.shrink()
                : Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: dW * 0.02),
                    padding: EdgeInsets.symmetric(horizontal: dW * 0.02),
                    child: Text(
                      footer,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          letterSpacing: .05,
                          fontSize: headline4.toDouble(),
                          decorationStyle: TextDecorationStyle.dashed),
                    ),
                  ),
          ]),
    );
  }
}
