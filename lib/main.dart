import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('#fightcorona'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 20.0,bottom: 600.0),
                  child: Row(
                    children: <Widget>[
                      Text("Cases:-",style:
                        TextStyle(
                          color: Colors.blueAccent,
                        ),),
                      Card(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(snapshot.data.cases.toString(),style:
                            TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),),
                        ),
                      ),
                      Text("Deaths:-",style:
                      TextStyle(
                        color: Colors.red,
                      ),),
                      Card(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(snapshot.data.deaths.toString(),style:
                          TextStyle(
                            color: Colors.red,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700,
                          ),),
                        ),
                      ),
                      Text("Recovered:-",style:
                      TextStyle(
                        color: Colors.green,
                      ),),
                      Card(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(snapshot.data.cases.toString(),style:
                          TextStyle(
                            color: Colors.green,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700,
                          ),),
                        ),
                      ),
                    ],
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
    );
  }
}
