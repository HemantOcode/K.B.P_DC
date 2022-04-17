import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';

class management extends StatelessWidget {
  const management({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 7, 75),
          title: Center(child: Text("MANAGEMENT")),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                semanticContainer: true,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(children: [
                    Text(
                      "ADARSH VIKAS MANDAL",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/man.png")
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
