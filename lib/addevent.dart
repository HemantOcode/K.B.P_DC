import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Add_Events extends StatelessWidget {
  const Add_Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 7, 75),
          title: const Center(child: const Text("EVENT'S MANAGEMENT")),
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
              Container(
                alignment: Alignment.center,
                child: Card(
                  shadowColor: Color.fromARGB(255, 7, 1, 67),
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
                          Center(
                            child: const Text(
                              "Add Events\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Title"),
                          ),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            decoration: InputDecoration(
                              labelText: "Description",
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Other",
                            ),
                          ),
                        ]),
                  ),
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
