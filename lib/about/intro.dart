import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';

// ignore: camel_case_types
class intro extends StatelessWidget {
  const intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 7, 75),
          title: Center(child: Text("History / Indroduction")),
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
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.blue.shade300,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(children: [
                    Text(
                      "ABOUT THE COLLEGE:\n",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "Adarsh Vikas Mandal was founded in the year 1984 by renowned politician & veteran social worker Late Shree B.B. More Sir to cater to the educational needs of socially and economically challenged section of the society living around the area in particular. The institute established Karmaveer Bhaurao Patil Degree College in the year 2009 for providing quality higher education to aspiring students. The institution provides a learning environment and encourages the students to develop a modern outlook towards life. The college offers traditional as well as professional undergraduate courses like Bachelor of Commerce, Bachelor of Arts, Bachelor of Accounting & Finance, Bachelor of Banking & Insurance, and Bachelor of Science in Information Technology.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.blue.shade300,
                semanticContainer: true,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(children: [
                    Text(
                      "OUR EDUCATIONAL FAMILY:\n",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      " Bal Vidyamandir Primary School [Marathi & Semi-English Medium]\n\nBal Vidyamandir Secondary School [Marathi & Semi-English Medium]\n\nAdarsh English School [Pre Primary, Primary & Secondary]\n\nKarmaveer Bhaurao Patil Junior College [Arts, Commerce & Science]YCMOU Study Center",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
