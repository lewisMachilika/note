import 'package:flutter/material.dart';
class CustomTextArea extends StatelessWidget {
  final bool obscureText;

  final onChanged;
  final validator;

  final hint;

  final icon;

  final labelText;

  final controller;

  final onTap;

  final maxLines;
  const CustomTextArea({Key? key,required this.obscureText,this.onChanged,this.validator,this.hint,this.labelText,this.icon,this.controller,this.onTap, this.maxLines}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(validator: validator, obscureText: obscureText,onChanged: onChanged,controller: controller,
      onTap: onTap,
      maxLines: maxLines,
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
          /*prefixIcon: Padding(
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: icon,
            ),
            padding: EdgeInsets.only(left: 30, right: 10),
          )*/
      ),
    );
  }
}
