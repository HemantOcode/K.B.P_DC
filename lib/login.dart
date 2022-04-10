import 'package:flutter/material.dart';
import 'package:flutter_application_1/register.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 210, horizontal: 15),
      child: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/banner.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 33.0),
          TextFormField(
            // controller: _email,
            decoration: InputDecoration(
                labelText: "E-mail",
                icon: Icon(
                  Icons.email,
                  color: Colors.red,
                )),
          ),
          SizedBox(height: 19.0),
          TextFormField(
            // controller: _pass,
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Password",
                icon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                )),
          ),
          SizedBox(height: 10.0),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => register()));
              },
              child: Text("Register ")),
          ElevatedButton(
            onPressed: () {},
            child: Text("     Login      "),
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent.shade700),
          )
        ],
      ),
    ))));
  }
}
