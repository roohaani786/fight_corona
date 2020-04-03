import 'package:fight_corona/appbar.dart';
import 'package:fight_corona/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'bottomappbar.dart';



////////////////////////////////////////////////////////////////////

Future<Album> fetchAlbum() async {
  final response =
  await http.get('https://coronavirus-19-api.herokuapp.com/all');

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
  final int cases;
  final int deaths;
  final int recovered;

  Album({this.cases, this.deaths, this.recovered});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }
}


///////////////////////////////////////////////////////////////////


class MyHomePage extends StatefulWidget{
  MyHomePage({Key key}) : super(key:key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
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

        appBar: MyAppbar(),

      //ScaffoldBackgroundColor

        backgroundColor: Colors.white,


      //BottomNavigationBar

        bottomNavigationBar: MyBottomNavigationBar(),

      //Drawer

        drawer: MyDrawer(),

      //Body

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
                                  child: Text(snapshot.data.cases.toString(),style:
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
      theme: ThemeData(fontFamily: 'Sen',
      ),
    );
  }
}



