import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final double dW = MediaQuery.of(context).size.width;
    return AppBar(
      title: Text(
        title,
        style: TextStyle(letterSpacing: 2),
      ),
    
    );
  }

  Size get preferredSize => const Size.fromHeight(60);
}
