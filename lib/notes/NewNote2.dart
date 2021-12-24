import 'package:note/models/Note.dart';
import 'package:note/repositories/Repository.dart';
import 'package:note/repositories/RepositoryService.dart';
import 'package:note/widgets/CustomButton.dart';
import 'package:note/widgets/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';

import 'Notes.dart';

class HtmlEditorExample extends StatefulWidget {
  final initialText;

  final id;

  HtmlEditorExample({Key? key,this.initialText,this.id, required this.title}) : super(key: key);

  final String title;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  String result = '';
  final HtmlEditorController controller = HtmlEditorController();
  Note _note = new Note();
  RepositoryService dbService = RepositoryService();
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },

      child: loading? Loading(): Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0,
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () async{
                  // print("clicked");
                  // if (kIsWeb) {
                  //   controller.reloadWeb();
                  // } else {
                  //   controller.editorController!.reload();
                  // }
                  //

                  var txt = await controller.getText();
                  if (txt.contains('src=\"data:')) {
                    txt =
                    '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                  }
                  int id = widget.id;
                  print("The id is : ${id}");
                  setState(() async {
                    loading = true;
                    result = txt;
                    _note.note= txt;
                    _note.dueDate= DateTime.now();
                    _note.dateTime = DateTime.now();
                    if(id>0){
                      _note.id=id;
                      dynamic    res = await dbService.updateNoteData("note",_note,id);
                      if(res==null){
                        print("could not save the note");
                      }else Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notes()));
                    }
                    else{
                      dynamic    res = await dbService.insertNoteData("note", _note);
                      if(res==null){
                        print("could not save the note");
                      }else Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notes()));
                    }

                  });
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(

                  hint: 'Your text here, please start with header',
                  shouldEnsureVisible: true,
                  initialText:widget.initialText,
                  //adjustHeightForKeyboard: true,
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  toolbarPosition: ToolbarPosition.aboveEditor, //by default
                  toolbarType: ToolbarType.nativeScrollable, //nativeScrollable  nativeGrid

                  onButtonPressed: (ButtonType type, bool? status,
                      Function()? updateStatus) {
                    print(
                        "button '${describeEnum(type)}' pressed, the current selected status is $status");
                    return true;
                  },
                  onDropdownChanged: (DropdownType type, dynamic changed,
                      Function(dynamic)? updateSelectedItem) {
                    print(
                        "dropdown '${describeEnum(type)}' changed to $changed");
                    return true;
                  },
                  mediaLinkInsertInterceptor:
                      (String url, InsertFileType type) {
                    print(url);
                    return true;
                  },
                  mediaUploadInterceptor:
                      (PlatformFile file, InsertFileType type) async {
                    print(file.name); //filename
                    print(file.size); //size in bytes
                    print(file.extension); //file extension (eg jpeg or mp4)
                    return true;
                  },
                ),
                otherOptions: OtherOptions(height: 550),
                callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                  print('html before change is $currentHtml');
                }, onChangeContent: (String? changed) {
                  print('content changed to $changed');
                }, onChangeCodeview: (String? changed) {
                  print('code changed to $changed');
                }, onChangeSelection: (EditorSettings settings) {
                  print('parent element is ${settings.parentElement}');
                  print('font name is ${settings.fontName}');
                }, onDialogShown: () {
                  print('dialog shown');
                }, onEnter: () {
                  print('enter/return pressed');
                }, onFocus: () {
                  print('editor focused');
                }, onBlur: () {
                  print('editor unfocused');
                }, onBlurCodeview: () {
                  print('codeview either focused or unfocused');
                }, onInit: () {
                  print('init');
                },
                    //this is commented because it overrides the default Summernote handlers
                    /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                    onImageUploadError: (FileUpload? file, String? base64Str,
                        UploadError error) {
                      print(describeEnum(error));
                      print(base64Str ?? '');
                      if (file != null) {
                        print(file.name);
                        print(file.size);
                        print(file.type);
                      }
                    }, onKeyUp: (int? keyCode) {
                      print('$keyCode key released');
                    }, onMouseDown: () {
                      print('mouse downed');
                    }, onMouseUp: () {
                      print('mouse released');
                    }, onPaste: () {
                      print('pasted into editor');
                    }, onScroll: () {
                      print('editor scrolled');
                    }),
                plugins: [
                  SummernoteAtMention(
                      getSuggestionsMobile: (String value) {
                        var mentions = <String>['test1', 'test2', 'test3'];
                        return mentions
                            .where((element) => element.contains(value))
                            .toList();
                      },
                      mentionsWeb: ['test1', 'test2', 'test3'],
                      onSelect: (String value) {
                        print(value);
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      onPressed: () {
                        controller.undo();
                      },
                      child:
                      Text('Undo', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      onPressed: () {
                        controller.clear();
                      },
                      child:
                      Text('Reset', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      width: 16,
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).accentColor),
                      onPressed: () async {

                        var txt = await controller.getText();
                        if (txt.contains('src=\"data:')) {
                          txt =
                          '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                        }
                        int id = widget.id;
                        print("The id is : ${id}");
                        setState(() async {
                          loading = true;
                          result = txt;
                          _note.note= txt;
                          _note.dueDate= DateTime.now();
                          _note.dateTime = DateTime.now();
                          if(id>0){
                            _note.id=id;
                            dynamic    res = await dbService.updateNoteData("note",_note,id);
                            if(res==null){
                              print("could not save the note");
                            }else Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notes()));
                          }
                          else{
                            dynamic    res = await dbService.insertNoteData("note", _note);
                            if(res==null){
                              print("could not save the note");
                            }else Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notes()));
                          }

                        });
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}