import 'package:flutter/material.dart';

successShowSnackBar({
  required BuildContext context,
  required String msg,
}) {
  final snackBar = SnackBar(
    content: Text(
      msg,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
    ),
    backgroundColor: Colors.greenAccent,
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

errorShowSnackBar({
  required BuildContext context,
  required String msg,
}) {
  final snackBar = SnackBar(
    content: Text(
      msg,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
    ),
    backgroundColor: Colors.red,
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

pushAndRemoveUntil({required BuildContext context, required Widget widget}) =>
    // Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);

differnceBetweenTwoDates(DateTime date1, DateTime date2) {
  final Duration differnce = date1.difference(date2);

  return differnce.toString().split('.').first.padLeft(8, "0");
}
