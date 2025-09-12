import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void TimeData() async{
    //Making the request to get data
    Response response = await get(Uri.parse("https://timeapi.io/api/time/current/zone?timeZone=Asia%2FKolkata"));
    Map data = jsonDecode(response.body);
    
    //Saving the time-data in a more readable format
    String datetime = data['dateTime'];
    String timeZone = data['timeZone'];
    //Printing the time-api data

    //print(data);
    //print('$datetime - $timeZone');

    //Create a Datetime Object
    DateTime now = DateTime.parse(datetime);  //A much neater dateTime format
    now = now.add(Duration(hours: 0));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    TimeData();
    print('Lets check the time!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading page')),
    );
  }
}

