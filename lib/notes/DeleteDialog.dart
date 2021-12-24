import 'package:flutter/material.dart';
import 'package:note/repositories/RepositoryService.dart';

import 'Notes.dart';
class DeleteDialog {

  static DeleteDialog customDialog=DeleteDialog() ;
  final RepositoryService _databaseService = RepositoryService();

  static DeleteDialog getInstance(){
    if(customDialog == null){
      customDialog = DeleteDialog();
    }
    return customDialog;
  }
  showAlertDialog({required BuildContext context, required String alertTitle, required String alertMessage,required String id}){
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
        _databaseService.deleteData("note",int.parse(id));
        //Navigator.pop(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Notes()));
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
