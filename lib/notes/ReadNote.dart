import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';
import 'package:html/parser.dart' show parse;
class ReadNote extends StatelessWidget {
   String note;
   ReadNote({Key? key,required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? htmlToString(String val) {
      // var doc = parse(html);
      // doc.getElementsByClassName("li").forEach((element) {
      //   print(element);
      // });

      final Html html = Html(data: val);

      String? stringToShare = html.data;
      return stringToShare;

    }
    print(note);
    return Scaffold(
        appBar: AppBar(
          title: Text('Note'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.share), onPressed: () {
                final RenderObject? box = context.findRenderObject();
                Share.share("under development",
                    subject:"Sharing a note"
                );
              },
            )
          ],
        ),
      body: SingleChildScrollView(
         child:Html(data: note)
      ),
    );
  }
}
