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
