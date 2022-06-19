import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:flutter_application_1/home/aboutus/about_provider.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:provider/provider.dart';

class InfraStructureScreen extends StatefulWidget {
  const InfraStructureScreen({Key? key}) : super(key: key);

  @override
  State<InfraStructureScreen> createState() => _InfraStructureScreenState();
}

class _InfraStructureScreenState extends State<InfraStructureScreen> {
  bool isLoading = false;
  myInit() async {
    setState(() {
      isLoading = true;
    });
    try {
      await Provider.of<AboutProvider>(context, listen: false)
          .fetchAppConfigsCommon(commonType: 'infra');
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

    final List<String> infra = Provider.of<AboutProvider>(context).infra;
    return Scaffold(
      appBar: AppBar(
        title: Text('Infrastructure'),
      ),
      drawer: HomeScreenAppDrawer(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Card(
                margin: EdgeInsets.all(dW * 0.04),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(dW * 0.02),

                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black)
                  // ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...infra.map((e) => ListTile(
                            visualDensity:
                                VisualDensity(vertical: -3), // to compact

                            title: Text(
                              e,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .80),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
