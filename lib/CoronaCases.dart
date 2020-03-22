//import 'package:fight_corona/corona_handler.dart';
//import 'package:flutter/material.dart';
//import 'package:fight_corona/http_service.dart';
//import 'http_service.dart';
//
//class CoronaCases extends StatelessWidget {
//  final HttpService httpService = HttpService();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Posts"),
//      ),
//      body: FutureBuilder(
//        future: httpService.getPosts(),
//        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
//          if (snapshot.hasData) {
//            List<Post> posts = snapshot.data;
//            return ListView.builder(
//              itemCount: data == null ? 0 : data.length,
//              itemBuilder: (BuildContext context, int index){
//                return new Card(
//                  child: new Text(data[index]["title"]),
//                );
//              },
//            ),
//          } else {
//            return Center(child: CircularProgressIndicator());
//          }
//        },
//      ),
//    );
//  }
//}
