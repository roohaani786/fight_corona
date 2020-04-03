import 'package:flutter/material.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';


class  MyBottomNavigationBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GradientBottomNavigationBar(
      backgroundColorStart: Colors.red,
      backgroundColorEnd: Colors.green,


      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,), title: Text('Home',style: TextStyle(color:
        Colors.white),)),
        BottomNavigationBarItem(icon: Icon(Icons.feedback,color: Colors.white), title: Text('MythBusters',style: TextStyle(color:
        Colors.white),)),
        BottomNavigationBarItem(icon: Icon(Icons.whatshot,color: Colors.white), title: Text('Hotspots',style: TextStyle(color:
        Colors.white),)),
      ],

    );
  }

}