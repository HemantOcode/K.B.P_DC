import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';

class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("ABOUT")),
        ),
        drawer: drawer(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
          child: Column(
            children: [
              SafeArea(
                child: Image.asset('assets/banner.png'),
              ),
              SizedBox(height: 10),
              Text(
                  "About Content\n sdfs \n gsad\n kjhdskj \n jsffkjhsscn \nkjhdfksjkn")
            ],
          ),
        ),
      ),
    ));
  }
}
