import 'package:fight_corona/appbar.dart';
import 'package:fight_corona/bottomappbar.dart';
import 'package:fight_corona/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;




/////////////////////////////////////////


Future<Album> fetchAlbum() async {
  final response =
  await http.get('https://coronavirus-19-api.herokuapp.com/countries/india');

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
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;

  Album({this.country, this.cases, this.todayCases, this.deaths, this.todayDeaths, this.recovered, this.active, this.critical, this.casesPerOneMillion, this.deathsPerOneMillion});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        country: json['country'],
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todaydeaths'],
        recovered: json['recovered'],
        active: json['active'],
        critical: json['active'],
        casesPerOneMillion: json['casesperonemillion'],
        deathsPerOneMillion: json['deathsperonemillion']
    );
  }
}



/////////////////////////////////////

class CasesIndia extends StatefulWidget{
  @override
  _CasesIndiaState createState() => _CasesIndiaState();
}

class _CasesIndiaState extends State<CasesIndia> {
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

        //Scaffold Background Color

        backgroundColor: Colors.white,

        //AppBar

        appBar: MyAppbar(),

        //BottomNavigationBar

        bottomNavigationBar: MyBottomNavigationBar(),

        //Drawer

        drawer: MyDrawer(),

        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return Padding(
                  padding: const EdgeInsets.only(left: 30.0,top: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 14.0,left:45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: <Widget>[
                            Text("Coronavirus cases in India",textAlign: TextAlign.center,style:
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


                            Padding(padding: const EdgeInsets.only(top: 20.0)),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(

                                  height: 100.0,
                                  width: 100.0,
                                  color: Colors.blueAccent,
                                  alignment:Alignment.center,
                                  child: Text("Today Cases",style:
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
                                  child: Text(snapshot.data.todayCases.toString(),style:
                                  TextStyle(
                                      color: Colors.blueAccent
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
                                  color: Colors.redAccent,
                                  alignment:Alignment.center,
                                  child: Text("Deaths Today",style:
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
                                  child: Text(snapshot.data.todayDeaths.toString(),style:
                                  TextStyle(
                                      color: Colors.redAccent
                                  ),
                                 ),
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


      //Text Font-------------
      ),
      theme: ThemeData(fontFamily: 'Sen',
      ),
      //----------------


    );
  }
}