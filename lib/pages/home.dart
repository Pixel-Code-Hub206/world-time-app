import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};  //The actual data to be printed

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map? ?? {};  //Taking the data arguments with a null safety check
    print(data);

    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            label: Text('Edit Location'),
            icon: Icon(Icons.edit_location),
          ),
        ],
      )),
    );
  }
}
