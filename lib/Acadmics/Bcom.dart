import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Bcom extends StatelessWidget {
  const Bcom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 7, 75),
          title: const Center(child: const Text("BACHELOR OF COMMERCE")),
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
                  padding: EdgeInsets.all(12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.all(5)),
                        const Center(
                          child: const Text(
                            "BACHELOR OF COMMERCE\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        const Center(
                          child: const Text(
                            "Bachelor of Commerce\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                            "Duration : 3 Years (6 Semesters)\nTotal Intake : 120\nIt’s a 3 years full time undergraduate course, affiliated to University of Mumbai. This course aims towards making the student well prepared to sustain as a corporate employee or as an entrepreneur. The student has adequate knowledge of adapting to the changes in the flexible business world, can focus internationally and has an in-depth understanding of the business world’s market-relevant aspects"),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Syllabus:\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Center(child: Image.asset("assets/BIsem1.png")),
                        Center(child: Image.asset("assets/BIsem2.png")),
                        Center(child: Image.asset("assets/BIsem3.png")),
                        Center(child: Image.asset("assets/BIsem4.png")),
                        Center(child: Image.asset("assets/BIsem5.png")),
                        Center(child: Image.asset("assets/BIsem6.png")),
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
