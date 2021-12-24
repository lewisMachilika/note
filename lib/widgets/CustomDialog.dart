import 'package:flutter/material.dart';
class CustomDialog {

  static CustomDialog customDialog=CustomDialog() ;

  static CustomDialog getInstance(){
    if(customDialog == null){
      customDialog = CustomDialog();
    }
    return customDialog;
  }
  showAlertDialog({required BuildContext context, required String alertTitle, required String alertMessage}){
    // set up the buttons
    Widget cancelButton = FlatButton(
      color: Colors.red,
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      color: Colors.green,
      child: Text("Continue"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(alertTitle),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(alertMessage)
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }

}
