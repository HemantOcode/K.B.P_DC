import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';
import 'package:flutter_application_1/helper/footer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart';

class contus extends StatelessWidget {
  const contus({Key? key}) : super(key: key);
  _launchURL() async {
    const url =
        "https://maps.google.com/maps?ll=19.196457,72.952339&z=14&t=m&hl=en&gl=IN&mapclient=embed&cid=10210484004550566170";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final contact = '+912225827799';

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 7, 75),
          title: const Center(child: const Text("CONTACT US")),
        ),
        drawer: drawer(),
        body: Column(
          children: [
            Card(
              child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: SafeArea(child: Image.asset('assets/banner.png'))),
            ),
            const SizedBox(
                height: 5,
                width: double.infinity,
                child: const DecoratedBox(
                    decoration: BoxDecoration(
                  color: Color.fromARGB(255, 14, 7, 75),
                ))),
            const SizedBox(
              height: 18,
            ),
            Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.black, width: 1),
              ),
              color: Colors.grey.shade200,
              semanticContainer: true,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.all(5)),
                    const Center(
                      child: const Text(
                        "ADDRESS\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    const Center(
                      child: const Text(
                        "Address : Adarsh Vikas Mandal’s\nKarmaveer Bhaurao Patil College,\nRoad No, 16V, Near Nehru Nagar,\nBehind Wagale Fire Brigade, Wagale Estate,\nThane 400 604.\nEmail : kbp.degreecollege@yahoo.com\nWeb: https://www.kbpcollegethane.net",
                      ),
                    ),
                    Container(
                        child: Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 55)),
                        const Center(
                          child: const Text(
                            "Contact:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                            onPressed: () async {
                              launch("tel://$contact");
                            },
                            child: Text("02225827799"))
                      ],
                    )),
                    const SizedBox(
                      height: 8,
                    ),
                  ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.black, width: 1),
              ),
              color: Colors.grey.shade200,
              semanticContainer: true,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const Center(
                        child: const Icon(
                      Icons.location_on,
                      size: 50,
                    )),
                    const Padding(padding: EdgeInsets.all(5)),
                    const Center(
                      child: Text(
                        "LOCATION\n",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _launchURL();
                        },
                        child: const Text("Get Location"),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 14, 7, 75),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 29, vertical: 14),
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ]),
            ),
            footer()
          ],
        ),
      ),
    ));
  }
}
