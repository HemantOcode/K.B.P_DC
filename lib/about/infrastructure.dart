import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';

class infras extends StatelessWidget {
  const infras({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 7, 75),
          title: const Center(child: const Text("INFRASTRUCTURE")),
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
                height: 20,
              ),
              Card(
                elevation: 12,
                shape: const RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 1),
                ),
                color: Colors.grey.shade200,
                semanticContainer: true,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(12)),
                      const Center(
                        child: const Text(
                          "INFRASTRUCTURE\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(12)),
                      const Center(
                        child: const Text(
                          "Classrooms\nComputer Lab/Electronics Lab\nNew well equipped Office\nPrincipal’s Room along with Conference Room\nCounseling Room\nGirls Room\nBoys Room\nMedical Room\nNSS\nStudent Council\nExam Room\nStaff Room\nLibrary\nRecord room\nNakshatraBaug\nGround\nCanteen",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
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
