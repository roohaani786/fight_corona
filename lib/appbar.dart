import 'package:flutter/material.dart';


class MyAppbar extends AppBar{


  MyAppbar({Key key, Widget title}) : super(key: key,

  //title

  title:
  Padding(
    padding: const EdgeInsets.all(36.0),
    child: Text("Fight Corona",style: TextStyle(fontSize: 22.0,fontStyle: FontStyle.normal,letterSpacing: 3.0,),textAlign: TextAlign.center,

    ),
  ),

  //FlexibleSpace

  flexibleSpace :
  Container(

    decoration: BoxDecoration(

      gradient: LinearGradient(colors: [
        Colors.red,
        Colors.green,
      ]),
      borderRadius: BorderRadius.circular(40.0),
      boxShadow: [
        new BoxShadow(blurRadius: 40.0)
      ],

    ),
  ),

  //actions

  actions:
  <Widget>[
    Icon(Icons.healing),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(Icons.live_help),
    ),

  ],

  //AppbarBackgroundColor

  backgroundColor: Colors.white,
















  );
}