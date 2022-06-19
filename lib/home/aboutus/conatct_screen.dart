import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../events/text_styles.dart';
import 'about_provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool isLoading = false;

  myInit() async {
    setState(() {
      isLoading = true;
    });
    try {
      await Provider.of<AboutProvider>(context, listen: false)
          .fetchAppConfigsCommon(commonType: 'contactus');
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
    final String collegeAddress =
        Provider.of<AboutProvider>(context).collegeAddress;
    final List<String> collegePhone =
        Provider.of<AboutProvider>(context).collegePhone;

    final String collegeBannar =
        Provider.of<AboutProvider>(context).collegeBannar;

    final socialMedia = Provider.of<AboutProvider>(context).socialMedia;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      drawer: const HomeScreenAppDrawer(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Column(
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
                          "Address",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: headline4.toDouble(),
                              color: Colors.white,
                              letterSpacing: .56),
                        ),
                        ListTile(
                          minLeadingWidth: 0.0,
                          contentPadding: EdgeInsets.all(0),
                          onTap: () async {
                            if (await canLaunch('')) {
                              launch('');
                            } else {
                              errorSnackbar(context, 'Unable to open map');
                            }
                          },
                          title: Text(
                            collegeAddress,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: headline5.toDouble(),
                                fontWeight: FontWeight.w500,
                                letterSpacing: .56),
                          ),
                          trailing: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ),
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
                        "Contact Numbers",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: headline4.toDouble(),
                            color: Colors.white,
                            letterSpacing: .56),
                      ),
                      SizedBox(
                        height: dW * 0.02,
                      ),
                      ...collegePhone.map(
                        (e) => ListTile(
                          visualDensity: VisualDensity(vertical: -3),
                          contentPadding: EdgeInsets.all(0),
                          onTap: () async {
                            if (await canLaunch('')) {
                              launch('');
                            } else {
                              errorSnackbar(context, 'Unable to open phone');
                            }
                          },
                          title: Text(e,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: headline5.toDouble(),
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: .80)),
                          trailing: const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  // width: double.infinity,
                  margin: EdgeInsets.all(dW * 0.05),
                  child: Wrap(
                    spacing: dW * 0.1,
                    children: [
                      ...socialMedia.map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () {
                                launch(e['url']!);
                              },
                              child: SizedBox(
                                height: dW * 0.1,
                                width: dW * 0.1,
                                child: Image.network(e['icon']!),
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            )),
    );
  }
}
