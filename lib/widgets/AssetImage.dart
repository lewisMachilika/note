import 'dart:ffi';

import 'package:flutter/material.dart';
class CustomAssetImage extends StatefulWidget {
  final String path;

  final double height;

  final double width;

  const CustomAssetImage({Key? key, required this.path, required this.height,required this.width}) : super(key: key);

  @override
  _CustomAssetImageState createState() => _CustomAssetImageState();
}

class _CustomAssetImageState extends State<CustomAssetImage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage('assets/images/ALP_6843.jpg'),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}
