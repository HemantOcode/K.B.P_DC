import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';

class infras extends StatelessWidget {
  const infras({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 7, 75),
          title: Center(child: Text("INFRASTRUCTURE")),
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
                height: 20,
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
                      Padding(padding: const EdgeInsets.all(12)),
                      Center(
                        child: Text(
                          "INFRASTRUCTURE\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(12)),
                      Center(
                        child: Text(
                          "Classrooms\nComputer Lab/Electronics Lab\nNew well equipped Office\nPrincipal’s Room along with Conference Room\nCounseling Room\nGirls Room\nBoys Room\nMedical Room\nNSS\nStudent Council\nExam Room\nStaff Room\nLibrary\nRecord room\nNakshatraBaug\nGround\nCanteen",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
