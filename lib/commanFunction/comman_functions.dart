import 'package:flutter/material.dart';

successSnackbar(BuildContext context, String msg, [int duration = 2]) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg,
        style: TextStyle(fontWeight: FontWeight.w500), softWrap: true),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.greenAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    duration: Duration(seconds: duration),
    margin: EdgeInsets.only(
        // bottom: 20,
        bottom: MediaQuery.of(context).size.height - 100,
        right: 20,
        left: 20),
  ));
}

errorSnackbar(BuildContext context, String msg, [int duration = 2]) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg,
        style: TextStyle(fontWeight: FontWeight.w500), softWrap: true),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.redAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    duration: Duration(seconds: duration),
    margin: EdgeInsets.only(
        // bottom: 10,
        bottom: MediaQuery.of(context).size.height - 100,
        right: 20,
        left: 20),
  ));
}

pushAndRemoveUntil({required BuildContext context, required Widget widget}) =>
    // Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);

pop(BuildContext context) => Navigator.pop(context);

differnceBetweenTwoDates(DateTime date1, DateTime date2) {
  final Duration differnce = date1.difference(date2);

  return differnce.toString().split('.').first.padLeft(8, "0");
}
