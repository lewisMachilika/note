import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:note/models/Note.dart';
import 'package:note/repositories/RepositoryService.dart';
import 'package:note/widgets/AssetImage.dart';
import 'package:note/widgets/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:note/widgets/CustomDialog.dart';
import 'package:note/widgets/CustomTextFromField.dart';
import 'DeleteDialog.dart';
import 'NewNote2.dart';
import 'ReadNote.dart';
class Deleveloper extends StatefulWidget {
  const Deleveloper({Key ?key}) : super(key: key);

  @override
  _DeleveloperState createState() => _DeleveloperState();
}

class _DeleveloperState extends State<Deleveloper> {

  getTitle(String msg){
    RegExp exp = RegExp(r'<h1>([a-z0-9-?.? ]+)',caseSensitive: false);
    var match = exp.firstMatch(msg);
    if(match == null) {
      exp = RegExp(r'<h2>([a-z0-9-?.? ]+)', caseSensitive: false);
      match = exp.firstMatch(msg);
      if(match == null)return "";
    }
    return match.group(1);
  }
  convertTimeStampToDate(Timestamp timestamp){
    return timestamp.toDate().toString();
  }
  TextEditingController email = TextEditingController();
  TextEditingController twitter = TextEditingController();
  TextEditingController linkedin = TextEditingController();
  TextEditingController skype = TextEditingController();
  TextEditingController facebook = TextEditingController();

  getDataList() async {

      setState(() {
        email.text = "lmachilika@gmail.com,\nluja.programmer@gmail.com";
        twitter.text = "@lewis_machilika";
        linkedin.text = "Lewis Machilika";
        skype.text = "live:lmachilika";
        facebook.text = "lewis machilika";
      });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataList();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            title: Text('Developer'),
            centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
            //Logo(),
            //Image.asset("assets/images/ALP_6843.jpg",height: 150.0,),

              //CustomAssetImage(path: "assets/images/ALP_6843.jpg",height: 200.0,width: 200.0),
              ListTile(

                title: Text("LEWIS MACHILIKA\n"),
                focusColor: Colors.green,
                tileColor: Colors.grey[300],
                subtitle: Text("Geek Dev"),

              ),

              SizedBox(height:20.0),
              TextFormField(
                controller: email,
                readOnly: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),

                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                    prefixIcon: Padding(
                      child: IconTheme(
                        data: IconThemeData(color: Theme.of(context).primaryColor),
                        child: Icon(Icons.email),
                      ),
                      padding: EdgeInsets.only(left: 30, right: 10),
                    )
                ),

              ),
              SizedBox(height:20.0),
              TextFormField(
                controller: twitter,
                readOnly: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),

                  labelText: "Twitter",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                    prefixIcon: Padding(
                      child: IconTheme(
                        data: IconThemeData(color: Theme.of(context).primaryColor),
                        child: ImageIcon(AssetImage("assets/icons/twitter.png")),
                      ),
                      padding: EdgeInsets.only(left: 30, right: 10),
                    ),
                ),
              ),
              SizedBox(height:20.0),
              TextFormField(
                controller: linkedin,
                readOnly: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),

                  labelText: "LinkedIn",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Padding(
                    child: IconTheme(
                      data: IconThemeData(color: Theme.of(context).primaryColor),
                      child: ImageIcon(AssetImage("assets/icons/linkedin.png")),
                    ),
                    padding: EdgeInsets.only(left: 30, right: 10),
                  ),
                ),
              ),
              SizedBox(height:20.0),
              TextFormField(
                controller: skype,
                readOnly: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),

                  labelText: "Skype",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Padding(
                    child: IconTheme(
                      data: IconThemeData(color: Theme.of(context).primaryColor),
                      child: ImageIcon(AssetImage("assets/icons/skype.png")),
                    ),
                    padding: EdgeInsets.only(left: 30, right: 10),
                  ),
                ),
              ),
              SizedBox(height:20.0),
              TextFormField(
                controller: facebook,
                readOnly: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),

                  labelText: "Facebook",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Padding(
                    child: IconTheme(
                      data: IconThemeData(color: Theme.of(context).primaryColor),
                      child: ImageIcon(AssetImage("assets/icons/facebook.png")),
                    ),
                    padding: EdgeInsets.only(left: 30, right: 10),
                  ),
                ),
              ),

            ],
        )
        )
    );
  }
}
