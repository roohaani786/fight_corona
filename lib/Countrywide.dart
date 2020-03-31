import 'package:fight_corona/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';



/////////////////////////////////////////


Future<Album> fetchAlbum() async {
  final response =
  await http.get('https://coronavirus-19-api.herokuapp.com/countries');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int id;
  final String country;
  final int cases;
  final int deaths;
  final int recovered;

  Album({this.cases, this.deaths, this.recovered, this.country, this.id});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      country: json['country'],
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }
}



/////////////////////////////////////

class CountryWide extends StatefulWidget{
  @override
  _CountryWideState createState() => _CountryWideState();
}

class _CountryWideState extends State<CountryWide> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          title: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Text("Fight Corona",style: TextStyle(fontSize: 22.0,fontStyle: FontStyle.normal,letterSpacing: 3.0,),textAlign: TextAlign.center,

            ),
          ),
          flexibleSpace: Container(

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
//        backgroundColor: Colors.black,


          actions: <Widget>[
            Icon(Icons.healing),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.live_help),
            ),

          ],

        ),
        backgroundColor: Colors.white,


        bottomNavigationBar: GradientBottomNavigationBar(
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





//        child: Padding(
//          padding: const EdgeInsets.all(12.0),
//          child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              Icon(Icons.home,color: Colors.white,),
//              Icon(Icons.local_hospital,color: Colors.white,),
//              Icon(Icons.whatshot,color: Colors.white,),
//              Icon(Icons.settings,color: Colors.white,),
//            ],
//          ),
//        ),

//        color: Colors.lightBlue,



        ),

        drawer: Drawer(
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

                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
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

                  Navigator.pop(context);
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
        ),

        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0,left:50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: <Widget>[
                            Text("Worldwide CoronaVirus cases",textAlign: TextAlign.center,style:
                            TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),),

                            Padding(padding: const EdgeInsets.only(top: 30.0)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[


                                Container(
                                  height: 100.0,

                                  width: 100.0,
                                  color: Colors.blue,
                                  alignment:Alignment.center,
                                  child: Text("Cases",style:
                                  TextStyle(
                                    color: Colors.white,
                                  ),),
                                ),

                                Padding(padding: const EdgeInsets.only(left: 40.0)),


                                Container(
                                  height: 100.0,

                                  width: 100.0,
                                  color: Colors.black,
                                  alignment:Alignment.center,
                                  child: Text(snapshot.data.id.toString(),style:
                                  TextStyle(
                                      color: Colors.blue
                                  ),),
                                ),
                              ],
                            ),

                            Padding(padding: const EdgeInsets.only(top: 20.0)),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  color: Colors.red,
                                  alignment:Alignment.center,
                                  child: Text("Deaths",style:
                                  TextStyle(
                                      color: Colors.white
                                  ),),
                                ),


                                Padding(padding: const EdgeInsets.only(left: 40.0)),
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  color: Colors.black,
                                  alignment:Alignment.center,
                                  child: Text(snapshot.data.deaths.toString(),style:
                                  TextStyle(
                                    color: Colors.red,
                                  ),),
                                ),
                              ],
                            ),


                            Padding(padding: const EdgeInsets.only(top: 20.0)),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(

                                  height: 100.0,
                                  width: 100.0,
                                  color: Colors.green,
                                  alignment:Alignment.center,
                                  child: Text("Recovered",style:
                                  TextStyle(
                                    color: Colors.white,
                                  ),),
                                ),

                                Padding(padding: const EdgeInsets.only(left: 40.0)),

                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  color: Colors.black,
                                  alignment:Alignment.center,
                                  child: Text(snapshot.data.recovered.toString(),style:
                                  TextStyle(
                                      color: Colors.green
                                  ),),
                                ),
                              ],
                            ),


                          ],


                        ),


                      ],
                    ),



                  ),
                );


              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");

              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),



      ),
      theme: ThemeData(fontFamily: 'KaushanScript',
      ),







    );
  }
}