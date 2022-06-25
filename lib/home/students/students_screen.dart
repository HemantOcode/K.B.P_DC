import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:flutter_application_1/commanWidget/app_bar.dart';
import 'package:flutter_application_1/home/events/text_styles.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  bool isLoading = false;
  myInit() async {
    setState(() {
      isLoading = true;
    });

    try {
      await Provider.of<AuthProvider>(context, listen: false).fetchStudents();
    } catch (e) {
      errorSnackbar(context, e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    myInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final studentsList = Provider.of<AuthProvider>(context).students;
    return Scaffold(
      appBar: AppBar(title: Text('Students')),
      drawer: HomeScreenAppDrawer(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: ((context, index) => ListTile(
                    onTap: () {
                      launch('tel: ${studentsList[index].phone}');
                    },
                    leading: CircleAvatar(
                      child: Image.asset(
                        'assets/png/name.png',
                        fit: BoxFit.fill,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          studentsList[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            fontSize: headline5.toDouble(),
                          ),
                        ),
                        Text(
                          studentsList[index].email,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            fontSize: headline6.toDouble(),
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.phone,
                      color: Theme.of(context).primaryColor,
                    ),
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
