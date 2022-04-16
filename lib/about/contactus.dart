import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class contus extends StatelessWidget {
  const contus({Key? key}) : super(key: key);

  _launchURL() async {
    const url =
        "https://maps.google.com/maps?ll=19.196457,72.952339&z=14&t=m&hl=en&gl=IN&mapclient=embed&cid=10210484004550566170";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "could not Load $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 7, 75),
          title: Center(child: Text("CONTACT US")),
        ),
        drawer: drawer(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
          child: Column(
            children: [
              Card(
                child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    child: SafeArea(child: Image.asset('assets/banner.png'))),
              ),
              SizedBox(
                  height: 5,
                  width: double.infinity,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                    color: Color.fromARGB(255, 14, 7, 75),
                  ))),
              SizedBox(
                height: 18,
              ),
              Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                ),
                color: Colors.grey.shade200,
                semanticContainer: true,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.all(5)),
                      Center(
                        child: Text(
                          "ADDRESS\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(4)),
                      Center(
                        child: Text(
                          "Address : Adarsh Vikas Mandal’s\nKarmaveer Bhaurao Patil College,\nRoad No, 16V, Near Nehru Nagar,\nBehind Wagale Fire Brigade, Wagale Estate,\nThane 400 604.\nPhone Numbers : 022-2582 7799\nEmail : kbp.degreecollege@yahoo.com\nWeb: https://www.kbpcollegethane.net",
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ]),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                ),
                color: Colors.grey.shade200,
                semanticContainer: true,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Center(
                          child: Icon(
                        Icons.location_on,
                        size: 50,
                      )),
                      Padding(padding: const EdgeInsets.all(5)),
                      Center(
                        child: Text(
                          "LOCATION\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL();
                          },
                          child: Text("Get Location"),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 14, 7, 75),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 29, vertical: 16),
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
