import 'dart:async';
import 'dart:convert';
//import 'dart:html';
//import 'package:universal_html/html.dart' as html;
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

  Items item1 = new Items(
      title: "Calendar",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "assets/calendar.png");

  Items item2 = new Items(
    title: "Groceries",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "assets/food.png",
  );
  Items item3 = new Items(
    title: "Locations",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "assets/map.png",
  );
  Items item4 = new Items(
    title: "Activity",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "assets/festival.png",
  );
  Items item5 = new Items(
    title: "To do",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "assets/todo.png",
  );
  Items item6 = new Items(
    title: "Settings",
    subtitle: "",
    event: "2 Items",
    img: "assets/setting.png",
  );

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {



    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;

    return MaterialApp(
      title: 'Fight Corona',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Align(child: Text('Fight Corona',textAlign: TextAlign.center,),alignment: Alignment.center),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.help_outline),

            ),
          ],
          leading:  Icon(Icons.menu),


        ),
bottomNavigationBar: BottomAppBar(
  color: Colors.black,
  child: Padding(
    padding: const EdgeInsets.all(25.0),
    child: Row(
      children: <Widget>[
        Icon(Icons.home,color: Colors.white,size: 30.0,),
        Icon(Icons.more_vert,color: Colors.white,size: 30.0,),
        Icon(Icons.healing,color: Colors.white,size: 30.0,),
        Icon(Icons.more_vert,color: Colors.white,size: 30.0,),
        Icon(Icons.location_on,color: Colors.white,size: 30.0,),
        Icon(Icons.more_vert,color: Colors.white,size: 30.0,),
        Icon(Icons.store_mall_directory,color: Colors.white,size: 30.0,),
        Icon(Icons.more_vert,color: Colors.white,size: 30.0,),
        Icon(Icons.ac_unit,color: Colors.white,size: 30.0,),
        Icon(Icons.more_vert,color: Colors.white,size: 30.0,),
        Icon(Icons.feedback,color: Colors.white,size: 30.0,),

      ],
    ),
  )
),





//          return Padding(
//      padding: const EdgeInsets.only(left: 20.0,top: 100.0,bottom: 0.0),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: <Widget>[
//
//          Row(
//            children: <Widget>[
//
//              SizedBox(
//                width: 50.0,
//                height: 50.0,
//
//
//                child: const DecoratedBox(
//                  decoration: const BoxDecoration(
//                    color: Colors.purpleAccent,
//                  ),
//                  child: Align(
//                    alignment: Alignment.center,
//                    child: Text("Cases:-",style:
//                    TextStyle(
//                      color: Colors.white,
//
//                    ),),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(left:20.0, top:0.0,),
//                child: Container(
//                  width:50.0,
//                  height: 50.0,
//                  color: Colors.greenAccent,
//
//
//                  child: Padding(
//                    padding: const EdgeInsets.all(6.0),
//                    child: Align(
//                      alignment: Alignment.center,
//
//                      child: Text(snapshot.data.cases.toString(),style:
//                      TextStyle(
//                        color: Colors.blueAccent,
//
//                        fontSize: 13.0,
//                        fontWeight: FontWeight.w700,
//                      ),
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//
//
//
//
//
//            ],
//          ),
//
//          Padding(
//            padding: const EdgeInsets.only(left: 0.0,top: 40.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//
//                    Text("Deaths:-",style:
//                    TextStyle(
//                      color: Colors.red,
//                    ),),
//                    Card(
//
//                      color: Colors.black,
//                      child: Padding(
//                        padding: const EdgeInsets.all(6.0),
//                        child: Text(snapshot.data.deaths.toString(),style:
//                        TextStyle(
//                          color: Colors.red,
//                          fontSize: 13.0,
//                          fontWeight: FontWeight.w700,
//                        ),),
//                      ),
//                    ),
//
//                  ],
//                ),
////3
//                Padding(
//                  padding: const EdgeInsets.only(left: 0.0,top: 60.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//
//                          Container(
//                            width: 80.0,
//                            height: 50.0,
//                            color: Colors.green,
//                            child: Align(
//                              alignment: Alignment.center,
//                              child: Text("Recovered:-",style:
//                              TextStyle(
//                                color: Colors.white,
//                              ),),
//                            ),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.only(left: 8.0),
//                            child: Container(
//                              width: 80.0,
//                              height: 50.0,
//                              color: Colors.blue,
//                              child: Padding(
//                                padding: const EdgeInsets.all(6.0),
//                                child: Align(
//                                  alignment: Alignment.center,
//                                  child: Text(snapshot.data.recovered.toString(),style:
//                                  TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 13.0,
//                                    fontWeight: FontWeight.w700,
//                                  ),),
//                                ),
//                              ),
//
//                            ),
//                          ),
//                        ],
//                      ),
//
//                    ],
//                  ),
//                ),
//
//
//              ],
//
//            ),
//
//
//
//
//          ),
//        ],
//      ),
//    );

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
                TextStyle(color: Colors.white,
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
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}
