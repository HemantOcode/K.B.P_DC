import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Ba extends StatelessWidget {
  const Ba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 7, 75),
          title: const Center(child: const Text("BACHELOR OF ARTS")),
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
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.all(5)),
                        const Center(
                          child: const Text(
                            "BACHELOR OF ARTS\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        const Center(
                          child: const Text(
                            "Bachelor of Arts\nDuration : 3 Years (6 Semesters)\nTotal Intake : 120\nIt’s a 3 years full time undergraduate course, affiliated to University of Mumbai.",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Text("F.Y.B.A. (1st Year) (Semester I & II )",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(
                            "\nCommunication Skills (Compulsory)\nMarathi (Compulsory)\nFoundation Course\nHistory – I\nSociology – I\nHindi – I (Optional)"),
                        Center(
                          child: Text(
                              "\nS.Y.B.A. (2nd Year) (Semester III & VI )",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(
                            "\nFoundation Course\nHistory – II & III)\nSociology – II & III\nHindi – II & III\nSociology – I\nMass Communication"),
                        Center(
                          child: Text(
                              "\nT.Y.B.A. (3rd Year) (Semester V & VI )",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(
                            "\nHistory – (3 papers each)\nSociology – (3 papers each)"),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
