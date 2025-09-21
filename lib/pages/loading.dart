import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';   //To fetch the actual time
import 'package:flutter_spinkit/flutter_spinkit.dart';  //To create a pre-built spinner animation

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

    print('Lets check the time!');  //Checking Console response
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
        child: SpinKitFoldingCube(      //Function to call the spinner animation
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}

