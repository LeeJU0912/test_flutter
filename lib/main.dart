import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// run APP
void main() => runApp(const MyApp());

Future<UserInfo> fetching() async {
  final response = await http
      .get(Uri.parse('https://solved.ac/api/v3/user/show?handle=Leeju'));

  if (response.statusCode == 200) {
    return UserInfo.fromJson(jsonDecode(response.body));
  }
  else {
    throw Exception('Failed to load');
  }
}

class UserInfo {
  final String userID;

  const UserInfo({
    required this.userID,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userID: json['userID'],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("금호동3가"),
            ],
          ),

          actions: [Icon(Icons.search), Icon(Icons.list), Icon(Icons.notifications_none)],
        ),
        body: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.all(20),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  image: AssetImage("assets/rabbit.jpg"), height: 200, width: 200, fit: BoxFit.fitHeight,
                ),
              ),

              Container(
                width: 400,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함)",
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                    ),
                    Text("afasdfsdf",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("20원",
                    style: TextStyle(fontSize: 25),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("얼만데"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.favorite_border, size: 25,),
                              Text("4", style: TextStyle(fontSize: 25))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
