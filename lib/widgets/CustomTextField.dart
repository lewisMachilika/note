import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final Icon icon;
  final String hint;
  final TextEditingController controller;
  final bool obsecure;

  final String labelText;

  const CustomTextField({
    required this.controller,
    required this.hint,
    required this.icon,
    required this.labelText,
    required this.obsecure,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //validator: ,
      controller: controller,
      obscureText: obsecure,
      style: TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
          hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
          hintText: hint,
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            ),
          ),
          prefixIcon: Padding(
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: icon,
            ),
            padding: EdgeInsets.only(left: 30, right: 10),
          )
      ),
    );
  }
}
