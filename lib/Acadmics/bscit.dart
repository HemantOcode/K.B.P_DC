import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class It extends StatelessWidget {
  const It({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 7, 75),
          title: const Center(child: const Text("BACHELOR OF SCIENCE")),
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
                            "BACHELOR OF SCIENCE\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        const Center(
                          child: const Text(
                            "Bachelor of Science (Information Technology)\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                            "Duration : 3 Years (6 Semesters)\nTotal Intake : 60\nThis is an integrated three year degree course divided into six semesters introduced & designed by Mumbai University keeping in view the following objectives:-\nThis is an integrated three year degree course divided into six semesters introduced & designed by Mumbai University keeping in view the following objectives:-"),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("\nOBJECTIVE:\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "To main objectives is to provide basic inputs in various aspects & board understanding of IT and Management of IT.\nTo cater to the needs of the business by bridging the gap between managerial practices and Information Technology.\nTo produce employable graduate in Information Technology which will enable the industry to grow and he graduates to become successful in the field of Information Technology."),
                        Text("\nEligibility: (0.5204)\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "A candidate for being eligible for admission to this course shall have passed HSC Exam or equivalent exam by securing not less than 35% marks.\n(Mathematics subject is compulsory for HSC)Student passing an exam equivalent to HSC Board, Mumbai & Inter-Mediate (Arts / Commerce / science ) of Mumbai University or from other state & immigrating from other Universities , Boards & Seeking admission to the first year, will be admitted if he / she produce a valid “Provisional Eligibility Certificate” issued by Mumbai University for the current academic year and for the desired course. Such students should submit migration certificate, Statement of Marks & Passing Certificate along with true copies within two months from the date of admission. If student fails to do so, admission is liable to be cancelled.\nEvery candidate admitted to the degree course in the affiliated college shall have register with the Mumbai University.\n"),
                        Text(
                          "Syllabus:\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Center(child: Image.asset("assets/ITsem1.png")),
                        Center(child: Image.asset("assets/ITsem2.png")),
                        Center(child: Image.asset("assets/ITsem3.png")),
                        Center(child: Image.asset("assets/ITsem4.png")),
                        Center(child: Image.asset("assets/ITsem5.png")),
                        Center(child: Image.asset("assets/ITsem6.png")),
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
