import 'package:flutter/material.dart';
class Logo extends StatefulWidget {
  //const Logo({Key key}) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      //padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
      padding: EdgeInsets.all(15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
                  child: Align(
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),

                      width: 150,
                      height: 150,
                    ),
                  ),
                  height: 150,
                )),
            Positioned(
              child: Container(

                  height: 150,
                  child: Align(

                    child: Text(
                      "lu",
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
