import 'package:flutter/material.dart';
import 'Countrywide.dart';
import 'casesindia.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('#fightcorona',style: TextStyle(color: Colors.white,fontSize: 20.0),),
              decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(colors: [
                    Colors.red,
                    Colors.green,
                  ])
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app.

                Navigator.pop(context);
                // ...
              },
            ),
            ListTile(
              title: Text('Country Wide Cases'),
              onTap: () {
                // Update the state of the app.

                Navigator.push(context, MaterialPageRoute(builder: (context) => CountryWide()));
                // ...
              },
            ),

            ListTile(
              title: Text('Cases in India'),
              onTap: () {
                // Update the state of the app.

                Navigator.push(context, MaterialPageRoute(builder: (context) => CasesIndia()));
                // ...
              },
            ),

            ListTile(
              title: Text('MythBusters'),
              onTap: () {
                // Update the state of the app.

                Navigator.pop(context);
                // ...
              },
            ),

            ListTile(
              title: Text('Symptomps of CoronaVirus'),
              onTap: () {
                // Update the state of the app.

                Navigator.pop(context);
                // ...
              },
            ),

            ListTile(
              title: Text('About the App'),
              onTap: () {
                // Update the state of the app.

                Navigator.pop(context);
                // ...
              },
            ),
          ],
        ),
    );
  }

}


