import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Baf extends StatelessWidget {
  const Baf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 7, 75),
          title: const Center(child: const Text("Accounting & Finance")),
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
                            "B.COM (Accounting & Finance)\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        const Center(
                          child: const Text(
                            "Bachelor of Commerce (Accounting & Finance)\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                            "Duration : 3 Years (6 Semesters)\nTotal Intake : 120\nThis is an integrated three year degree course divided into six semesters introduced & designed by Mumbai University keeping in view the following objectives:-"),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("\nOBJECTIVE:\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "To create for the students of Mumbai University an additional avenue of self employment and also to benefit the industry by providing them with suitable trained persons in the field of To provide students with pragmatic knowledge in the field of Accounting & Finance.\nTo provide adequate basic understanding about Accounting & Finance education.\nTo provide students with pragmatic knowledge in the field of Accounting & Finance.\nTo prepare student to exploit opportunities ,being newly created in the Accounting & Finance profession.\nTo give an adequate exposure to operational environment in the field of Accounting & Finance.\nTo include training & practical approach by using modern technologies among the students in the field of Accounting & Finance."),
                        Text("\nEligibility: (0.5204)\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "A candidate for being eligible for admission to this course shall have passed HSC Exam or equivalent exam by securing not less than 35% marks at first attempt \n\nStudent passing an exam equivalent to HSC Board, Mumbai & Inter-Mediate (Arts / Commerce / science ) of Mumbai University or from other state & immigrating from other Universities , Boards & Seeking admission to the first year, will be admitted if he / she produce a valid “Provisional Eligibility Certificate” issued by Mumbai University for the current academic year and for the desired course.Such students should submit migration certificate, Statement of Marks & Passing Certificate along with true copies within two months from the date of admission. If student fails to do so, admission is liable to be cancelled.\n\nEvery candidate admitted to the degree course in the affiliated college shall have register with the Mumbai University.\n"),
                        Text(
                          "Syllabus:\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Center(child: Image.asset("assets/AFsem1.png")),
                        Center(child: Image.asset("assets/AFsem2.png")),
                        Center(child: Image.asset("assets/AFsem3.png")),
                        Center(child: Image.asset("assets/AFsem4.png")),
                        Center(child: Image.asset("assets/AFsem5.png")),
                        Center(child: Image.asset("assets/AFsem6.png")),
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
