import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/register.dart';
import 'package:flutter_application_1/imgslides.dart';
import 'helper/drawer.dart';
import 'about/intro.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'imgslides.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 14, 7, 75),
            title: Center(child: Text("Home")),
          ),
          drawer: drawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 228,
                  width: 400,
                  child: slideimg(),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  color: Color.fromARGB(255, 14, 7, 75),
                  semanticContainer: true,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Padding(padding: const EdgeInsets.all(5)),
                        Center(
                          child: Text(
                            "WELCOME\n",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orangeAccent.shade700),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(1)),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Adarsh Vikas Mandal was founded in the year 1984 by renowned politician & veteran social worker Late Shree B.B. More Sir to cater to the educational needs of socially and economically challenged section of the society living around the area in particular.\n\nThe institute established Karmaveer Bhaurao Patil Degree College in the year 2009 for providing quality higher education to aspiring students.The institution provides a learning environment and encourages the students to develop a modern outlook towards life. The college offers traditional as well as professional undergraduate courses like B.Com, B.A,BAF, BBI, and Bsc IT.\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade200),
                            ),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  color: Color.fromARGB(255, 14, 7, 75),
                  semanticContainer: true,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Padding(padding: const EdgeInsets.all(5)),
                        Center(
                          child: Text(
                            "BEYOND CLASSROOMS\n",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orangeAccent.shade700),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(1)),
                        Center(
                          child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Image.asset("assets/bc.jpg")),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  color: Color.fromARGB(255, 14, 7, 75),
                  semanticContainer: true,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Padding(padding: const EdgeInsets.all(5)),
                        Center(
                          child: Text(
                            "GOVERNING COUNCIL\n",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orangeAccent.shade700),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(1)),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Image.asset("assets/more.png"),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          )),
    ));
  }
}
