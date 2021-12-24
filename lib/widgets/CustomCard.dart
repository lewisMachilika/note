import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final subtitle;

  final title;

  final onDelete;

  final onTap;

  final navigator;

  const CustomCard({Key? key,this.navigator, required this.title,required this.subtitle ,required this.onTap ,required this.onDelete }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              onTap: onTap,
              //leading: Icon(Icons.sell_rounded, color: Colors.green),
              leading: IconButton(icon: Icon(Icons.edit,color: Colors.green,), onPressed: navigator,),
              title: Text(title),
              focusColor: Colors.green,
              tileColor: Colors.grey[300],
              subtitle: Text(subtitle),
              trailing: IconButton(
                focusColor: Colors.blue[500],
                icon: const Icon(Icons.delete_forever,color: Colors.red,),
                tooltip: 'Delete this item',
                onPressed: onDelete
              ),
            ),
          ],
        ),
      ),
    );
  }
}