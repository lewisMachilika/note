import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:note/models/Note.dart';
import 'package:note/repositories/RepositoryService.dart';
import 'package:note/widgets/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:note/widgets/CustomDialog.dart';
import 'DeleteDialog.dart';
import 'Developer.dart';
import 'NewNote2.dart';
import 'ReadNote.dart';
class Notes extends StatefulWidget {
  const Notes({Key ?key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {

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
  RepositoryService _repositoryService = RepositoryService();
  List<Note> noteList = [];
  getDataList() async {
    print("called");
    var notes = await _repositoryService.readData("note");
    notes.forEach((note){
      setState(() {
        print(note.toString());
        Note note2 = Note();
        note2.note=note["note"];
        note2.dateTime=DateTime.tryParse(note["DateTime"])!;
        note2.dueDate=DateTime.tryParse(note["dueDate"])!;
        note2.id=note["id"];
        print(note.toString());
        noteList.add(note2);
      });
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
          leading: IconButton( onPressed: () {
            setState(() {
              noteList = [];
            });
            getDataList();
            }, icon: Icon(Icons.refresh),),
          title: Text('Notes'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_outlined),
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HtmlEditorExample(title: 'new note',id: 0,)));
              },
            ),
            IconButton(
              icon: const Icon(Icons.info_outline_rounded),
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Deleveloper()));
              },
            ),
          ]
      ),
      body: ListView.builder(
            itemCount: noteList.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: CustomCard(title: getTitle(noteList[index].note),subtitle: "${noteList[index].dateTime}",
                    navigator:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HtmlEditorExample(title: 'new note',initialText: noteList[index].note,id: noteList[index].id,)));
                      },
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReadNote(note: noteList[index].note,)));
                    },
                    onDelete: (){
                      DeleteDialog().showAlertDialog(context:context,alertTitle:  "Are you sure you want to delete",alertMessage: getTitle(noteList[index].note), id: noteList[index].id.toString());
                    },
                  )
              );
            },
          )
    );
  }
}
