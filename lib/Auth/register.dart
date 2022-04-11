import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/login.dart';

class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 210, horizontal: 3),
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
                filled: true,
                fillColor: Colors.blue[100],
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25)),
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
                filled: true,
                fillColor: Colors.blue[100],
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25)),
                labelText: "Password",
                icon: Icon(
                  Icons.lock,
                  color: Colors.lightBlue,
                )),
          ),
          SizedBox(height: 19.0),
          TextFormField(
            obscureText: true,
            // controller: _confmpass,
            decoration: InputDecoration(
              labelText: "Conform Password",
              icon: Icon(
                Icons.lock,
                color: Colors.lightBlue,
              ),
              filled: true,
              fillColor: Colors.blue[100],
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => login()));
              },
              child: Text("Already Registered !! ")),
          ElevatedButton(
            onPressed: () {},
            child: Text("   Register   "),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19)),
                primary: Colors.deepPurpleAccent.shade700),
          )
        ],
      ),
    ))));
  }
}
