import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:provider/provider.dart';

import '../../commanFunction/comman_functions.dart';
import 'about_provider.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({Key? key}) : super(key: key);

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  bool isLoading = false;
  myInit() async {
    setState(() {
      isLoading = true;
    });
    try {
      await Provider.of<AboutProvider>(context, listen: false)
          .fetchAppConfigsCommon(commonType: 'management');
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
    super.initState();
    myInit();
  }

  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;

    final List<Map> management =
        Provider.of<AboutProvider>(context).managements;

    return Scaffold(
      appBar: AppBar(title: Text('Management')),
      drawer: HomeScreenAppDrawer(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: ((context, index) => ListTile(
                    title: Text(
                      management[index]['name'],
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, letterSpacing: .56),
                    ),
                    trailing: Text(management[index]['role'],
                        style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            letterSpacing: .56
                            )),
                  )),
              itemCount: management.length),
    );
  }
}
