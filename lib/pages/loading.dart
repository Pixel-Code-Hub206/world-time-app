import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'Kolkata', time: "", flag: 'india.png', url: 'Asia%2FKolkata');
    await instance.getTime();
    print(instance.time);
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
      body: SafeArea(child: Text('Loading page')),
    );
  }
}

