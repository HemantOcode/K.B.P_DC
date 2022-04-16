import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';

class miss_Visi extends StatelessWidget {
  const miss_Visi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 7, 75),
          title: Center(child: Text("VISION & MISSION")),
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
                      SizedBox(
                        height: 8,
                      ),
                      Center(
                          child: Icon(
                        Icons.remove_red_eye,
                        size: 50,
                      )),
                      Padding(padding: const EdgeInsets.all(5)),
                      Center(
                        child: Text(
                          "VISION\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(4)),
                      Center(
                        child: Text(
                          "Enrichment of students through quality education\n",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
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
                      Center(
                          child: Icon(
                        Icons.disc_full_outlined,
                        size: 50,
                      )),
                      Padding(padding: const EdgeInsets.all(5)),
                      Center(
                        child: Text(
                          "MISSION\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(4)),
                      Center(
                        child: Text(
                          "Serve diverse community of students with accessible and\n affordable education that enhances the quality of life.\n",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
