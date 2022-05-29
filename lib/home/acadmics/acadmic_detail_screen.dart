import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/acadmics/acadmic_model.dart';

class AcadmicDetailScreen extends StatefulWidget {
  const AcadmicDetailScreen({Key? key, required this.acadmicModal})
      : super(key: key);
  final AcadmicModal acadmicModal;

  @override
  State<AcadmicDetailScreen> createState() => _AcadmicDetailScreenState();
}

class _AcadmicDetailScreenState extends State<AcadmicDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: dW * 0.07,
        title: Text(
          widget.acadmicModal.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                SizedBox(
                  height: dW * 0.45,
                  width: dW,
                  child: Image.network(
                    'https://picsum.photos/200/300',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: dW * 0.35,
                  // left: dW * 0.1,
                  child: Container(
                    // width: double.infinity,
                    width: dW * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 0.1, color: Colors.grey),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1.0,
                            blurRadius: 10.0,
                            offset: Offset(3.0, 3.0))
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: dW * 0.05),

                    padding: EdgeInsets.all(dW * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.acadmicModal.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: dW * 0.02,
                        ),
                        Text(
                          widget.acadmicModal.description,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45),
                        ),
                        SizedBox(
                          height: dW * 0.02,
                        ),
                        Text(
                          widget.acadmicModal.objective,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45),
                        ),
                        SizedBox(
                          height: dW * 0.02,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.people_outline_outlined,
                              color: Colors.black87,
                            ),
                            SizedBox(
                              width: dW * 0.02,
                            ),
                            Text(
                              widget.acadmicModal.totalIntake,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.56),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: dW * 0.02,
                        ),
                        Text("Sylubis"),
                        Column(
                          children: [
                            ...widget.acadmicModal.semesters
                                .asMap()
                                .entries
                                .map((e) => Container(
                                      child: Text(e.toString()),
                                    ))
                          ],
                        )
                      ],
                    ),
                    // color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SemListtile extends StatelessWidget {
  const SemListtile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SubjectListTile extends StatelessWidget {
  const SubjectListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
