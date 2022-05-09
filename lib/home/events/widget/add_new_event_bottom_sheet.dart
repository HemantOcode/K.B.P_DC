import 'package:flutter/material.dart';
import 'package:flutter_application_1/text_styles.dart';
import 'package:intl/intl.dart';

class AddEventBottomSheet extends StatefulWidget {
  const AddEventBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddEventBottomSheet> createState() => _AddEventBottomSheetState();
}

class _AddEventBottomSheetState extends State<AddEventBottomSheet> {
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

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;
    final ts = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: EdgeInsets.all(dW * 0.05),
      // height: dW,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: dW * 0.15,
        ),
        Text(
          'Add New Event',
          style: getEventHeaderTextStyle(ts: ts),
        ),
        TextFormField(
          decoration: InputDecoration(label: Text('Title')),
        ),
        TextFormField(
          decoration: InputDecoration(label: Text('Description')),
        ),
        SizedBox(
          height: dW * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                        color: startDate == '' ? Colors.grey : Colors.blue),
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
                        color: endDate == '' ? Colors.grey : Colors.blue),
                    borderRadius: BorderRadius.circular(5)),
                child: endDate == ''
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
          ],
        ),
      ]),
    );
  }
}
