import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Bbi extends StatelessWidget {
  const Bbi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 7, 75),
          title: const Center(child: const Text("Banking & Insurance")),
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
                            "B.COM (BANKING & INSURANCE)\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        const Center(
                          child: const Text(
                            "Bachelor of Commerce (Banking & Insurance)\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                            "Duration : 3 Years (6 Semesters)\nTotal Intake : 60\n5208 The Title : The degree shall be titled as Bachelor of Commerce ( Banking and Insurance ) Objectives of the degree:To create for the students of University of Mumbai an additional avenue of self employment and also to benefit Banks, Insurance Companies and Industries by providing them with suitable trained persons in the field of Banking and Insurance.\nTo prepare student to exploit opportunities, being newly created in the field of Banking and Insurance due to Globalization, Privatization and Liberalization.\nTo provide adequate basic understanding about the Banking, Insurance and other financial services among the students.\nTo give an adequate exposure to operational environment in the field of Banking, Insurance and other related financial services.\nTo inculcate training and practical approach among the students by using modern technologies in the field of Banking, Insurance etc."),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("\nEligibility: (0.5204)\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "A candidate for being eligible for admission to this course shall have passed HSC Exam or equivalent exam by securing not less than 35% marks at first attempt.\nEvery candidate admitted to the Degree Course in the constituent / affiliated college / recognized institution, conducting the course, shall have to register himself / herself with the University.R. 4295 : Duration of the Course and related information :\nThe course shall be full time course. The duration of the course shall be six semesters spread over three years.\nThe course shall consist of 36 subjects & 1 Project in each subject.Total number of lectures per paper per semester ( Lecture shall be maximum of 60, each of 50 minutes duration.)\na. A candidate shall be allowed to keep terms for semester – III if he / she passes Semester – I and Semester – II taken together.\nb. A candidate shall be allowed to keep terms for semester-IV if he / she passes in each Semester – I ,II and III OR if he / she passes Semester – I and fails in not more than two theory paper of Semester –II and Semester –III taken together.\nc. A candidate shall be allowed to keep terms for semester – V if he / she passes in each Semester – I ,II and III, and IV OR if he / she passes Semester-I and passes Semester-II and fails fails in not more than two theory paper of Semester –III and Semester –IV taken together.\nd. A candidate shall be allowed to keep terms for semester – VI if he / she passes in each Semester – I ,II and III, and IV OR if he / she passes Semester-I and passes Semester-II and fails fails in not more than two theory paper of Semester – IV and Semester – V taken together.\n"),
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
