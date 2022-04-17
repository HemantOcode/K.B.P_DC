import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Acadmics extends StatelessWidget {
  const Acadmics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 7, 75),
          title: const Center(child: const Text("ACADMICS")),
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
