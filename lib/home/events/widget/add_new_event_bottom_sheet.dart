import 'package:flutter/material.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:flutter_application_1/home/events/event_provider.dart';
import 'package:flutter_application_1/home/events/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEventBottomSheet extends StatefulWidget {
  const AddEventBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddEventBottomSheet> createState() => _AddEventBottomSheetState();
}

class _AddEventBottomSheetState extends State<AddEventBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController guideController = TextEditingController();
  TextEditingController venueController = TextEditingController();

  bool isLoading = false;
  bool inCollege = false;
  String startDate = '';
  String endDate = '';
  selectDateTime(whichDate) async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(DateTime.now().year + 1));

    if (selectedDate != null) {
      debugPrint(selectedDate.toString());
      final TimeOfDay? time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (time != null) {
        debugPrint(time.toString());
        final DateTime selectedDateTime =
            selectedDate.add(Duration(hours: time.hour, minutes: time.minute));
        if (whichDate == 'start') {
          startDate = selectedDateTime.toString();
        }
        if (whichDate == 'end') {
          endDate = selectedDateTime.toString();
        }
        setState(() {});
      }
    }
  }

  submitForm() async {
    if (_formKey.currentState!.validate() && startDate != '' && endDate != '') {
      try {
        setState(() {
          isLoading = true;
        });
        final result = await Provider.of<EventProvider>(context, listen: false)
            .createEvent(eventBody: {
          'inCampus': inCollege,
          'location': venueController.text,
          'guide': guideController.text,
          'endDate': endDate,
          'startDate': startDate,
          'description': descController.text,
          'title': titleController.text
        });

        pop(context);
        if (result['success']) {
          successSnackbar(context, result['message']);
        } else {
          errorSnackbar(context, result['message']);
        }
      } catch (e) {
        errorSnackbar(context, e.toString());
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;
    final ts = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: EdgeInsets.all(dW * 0.05),
      // height: dW,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: dW * 0.15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add New Event',
                          style: getEventHeaderTextStyle(ts: ts),
                        ),
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.clear))
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(label: Text('Title')),
                      controller: titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value for this field';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(label: Text('Description')),
                      controller: descController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value for this field';
                        }
                      },
                    ),
                    SizedBox(
                      height: dW * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const [
                        Text('Start Time'),
                        Text('End Time'),
                      ],
                    ),
                    SizedBox(
                      height: dW * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => selectDateTime('start'),
                          child: Container(
                            padding: EdgeInsets.all(dW * 0.01),
                            alignment: Alignment.center,
                            height: dW * 0.12,
                            width: dW * 0.4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: startDate == ''
                                        ? Colors.grey
                                        : Colors.blue),
                                borderRadius: BorderRadius.circular(5)),
                            child: startDate == ''
                                ? null
                                : FittedBox(
                                    child: Text(
                                      DateFormat('dd MMM yyyy hh:mm a').format(
                                        DateTime.parse(startDate),
                                      ),
                                      style: getEventSubHeaderBoldTextStyle(
                                          ts: ts, color: Colors.blue),
                                    ),
                                  ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => selectDateTime('end'),
                          child: Container(
                            padding: EdgeInsets.all(dW * 0.01),
                            alignment: Alignment.center,
                            height: dW * 0.12,
                            width: dW * 0.4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: endDate == ''
                                        ? Colors.grey
                                        : Colors.blue),
                                borderRadius: BorderRadius.circular(5)),
                            child: endDate == ''
                                ? null
                                : FittedBox(
                                    child: Text(
                                      DateFormat('dd MMM yyyy hh:mm a').format(
                                        DateTime.parse(endDate),
                                      ),
                                      style: getEventSubHeaderBoldTextStyle(
                                          ts: ts, color: Colors.blue),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: dW * 0.04,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Guide'),
                      ),
                      controller: guideController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value for this field';
                        }
                      },
                    ),
                    SizedBox(
                      height: dW * 0.02,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: inCollege,
                          onChanged: (value) {
                            // inCollege = !value!;
                            setState(() {
                              inCollege = value!;
                            });
                          },
                        ),
                        Text(
                          'campus event',
                          style: getTitleText(ts: ts),
                        ),
                      ],
                    ),
                    if (!inCollege)
                      TextFormField(
                        decoration: InputDecoration(label: Text('Venue')),
                        controller: venueController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value for this field';
                          }
                        },
                      ),
                    SizedBox(
                      height: dW * 0.1,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: dW * 0.12,
                        child: ElevatedButton(
                          onPressed: () {
                            submitForm();
                          },
                          child: Text('Save'),
                        )),
                    SizedBox(
                      height: dW * 0.04,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: dW * 0.12,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'))),
                  ]),
            ),
    );
  }
}
