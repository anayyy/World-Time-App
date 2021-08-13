import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime object = WorldTime(location: 'Kolkata', flag: 'lmao', url: 'Asia/Kolkata');
    await object.getDateTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : object.location,
      'time': object.time,
      'date' : object.date,
      'isDayTime': object.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('World Time', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),),
        SpinKitWave(color: Colors.white, size: 30.0,),
        
      ]),
    );
  }
}