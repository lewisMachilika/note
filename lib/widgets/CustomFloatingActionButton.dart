import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final text;

  final icon;

  final onPressed;

  CustomFloatingActionButton({Key? key,required this.text,required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(text),
      icon: Icon(icon),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
