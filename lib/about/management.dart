import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';

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
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 55,
                  ),
                ),
                semanticContainer: true,
                child: Text("Shri. Sachin B. More"),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
