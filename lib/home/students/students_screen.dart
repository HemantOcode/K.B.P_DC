import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    final studentsList = Provider.of<AuthProvider>(context).students;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: ((context, index) => ListTile(
              title: Text(studentsList[index].name),
            )),
        itemCount: studentsList.length,
      ),
    );
  }
}


class StudentListTiles extends StatelessWidget {
  const StudentListTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
    );
  }
}


