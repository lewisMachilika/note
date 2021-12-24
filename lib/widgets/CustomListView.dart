import 'package:flutter/material.dart';

import 'CustomCard.dart';
import 'CustomDialog.dart';
class CustomListView extends StatefulWidget {
  const CustomListView({Key ? key}) : super(key: key);

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
    'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
    'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
    'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
    'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
    'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
    'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: europeanCountries.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: CustomCard(title: europeanCountries[index],subtitle: "Checking",
              onTap: () {
                CustomDialog().showAlertDialog(context:context,alertTitle:  "Purchases page",alertMessage: "Main");
              },
              onDelete: (){
                CustomDialog().showAlertDialog(context:context,alertTitle:  "Purchases page",alertMessage: "huwa");
              },
            )
        );
      },
    );
  }
}
