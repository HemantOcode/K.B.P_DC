import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  bool isLoading = false;
  myInit() {
    setState(() {
      isLoading = true;
    });

    try {
      Provider.of<AuthProvider>(context, listen: false).fetchStudents();
    } catch (e) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    myInit();
  }

  @override
  Widget build(BuildContext context) {
    final studentsList = Provider.of<AuthProvider>(context).students;
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.builder(
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
    return ListTile();
  }
}
