import 'package:flutter/material.dart';
class CustomRaisedButton extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;

  final String label;
  final Function() onPressed;

  final icon;

  final sizedBoxWidth;
  CustomRaisedButton({
    Key? key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.label,
    required this.onPressed,
    required this.icon,
    required this.sizedBoxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: RaisedButton(

        highlightElevation: 0.0,
        splashColor: secondaryColor,
        highlightColor: primaryColor,
        elevation: 0.0,

        color: primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0), side: BorderSide(color: Colors.white, width: 3)
        ),
        /*child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: secondaryColor, fontSize: 20),
        ),*/
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //color: Colors.white,
          children: <Widget>[
            Icon(icon,color: Colors.white),
            SizedBox(width: sizedBoxWidth,),// icon
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
