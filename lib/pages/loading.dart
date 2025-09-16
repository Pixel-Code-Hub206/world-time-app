import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading Time...';
  void setUpWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'Kolkata', time: "", flag: 'india.png', url: 'Asia%2FKolkata');    //Parameters to get time and flag data for the locations
    await instance.getTime();   //Gets the actual time
    print(instance.time);  //Prints the time in the console
    setState(() {
      time = instance.time;
    });
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
        child: Text(time),    //Displays the final time over the screen
      ),
    );
  }
}

