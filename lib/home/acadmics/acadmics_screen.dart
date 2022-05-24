import 'package:flutter/material.dart';
import 'package:flutter_application_1/commanWidget/app_bar.dart';
import 'package:flutter_application_1/home/acadmics/acadmic_provider.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:provider/provider.dart';

class AcadmicsScreen extends StatefulWidget {
  const AcadmicsScreen({Key? key}) : super(key: key);

  @override
  State<AcadmicsScreen> createState() => _AcadmicsScreenState();
}

class _AcadmicsScreenState extends State<AcadmicsScreen> {
  bool isLoading=false;
 




myInit()async{


setState(() {
  isLoading =true;

});


try {
 await  Provider.of<AcadmicProvider>(context,listen: false).fetchAcadmics();
  
} catch (e) {
  print(e);
}

}

  
  @override
  void initState() {

    super.initState();

myInit();

  }
  @override
  Widget build(BuildContext context) {
    final acadList = Provider.of<AcadmicProvider>(context).acadmics;

    return Scaffold(
      appBar: CustomAppBar(title: 'Acadmics'),
      drawer: HomeScreenAppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(acadList[index].name),
        ),
        itemCount: acadList.length,
      ),
    );
  }
}
