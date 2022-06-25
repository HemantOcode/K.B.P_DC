import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title, this.actions})
      : super(key: key);
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;
    return AppBar(
      title: Text(
        title,
        style: TextStyle(letterSpacing: 2),
      ),
      actions: actions ?? [],
    );
  }

  Size get preferredSize => const Size.fromHeight(60);
}
