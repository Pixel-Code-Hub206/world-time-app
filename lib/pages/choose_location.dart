import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
      ),
      body: TextButton(
        onPressed: () {},
        child: Text('Counter is suspended'),
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey,
          textStyle: TextStyle(
            fontSize: 14.0,
          )
        ),
      ),
    );
  }
}
