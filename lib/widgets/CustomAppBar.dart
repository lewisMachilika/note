import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
  //Size get preferredSize => throw UnimplementedError();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      //backgroundColor: Colors.red,
      centerTitle: true,
    );
  }
}
