import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Null...';  //Just a placeholder
  void setUpWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'India', time: "", flag: 'india.png', url: 'Asia%2FKolkata');    //Parameters to get time and flag data for the locations
    await instance.getTime();   //Gets the actual time
    print(instance.time);  //Prints the time in the console (Just for the output confirmation)

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
    });   //Pushing the data into the Home Page and traversing with it
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();

    print('Lets check the time!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Padding(
          padding: EdgeInsets.all(50.0),
        child: Text('Loading..'),    //Displays the final time over the UI screen
      ),
    );
  }
}

