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

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map? ?? {};  //Taking the data arguments with a null safety check
    print(data);

    //Setting background based on the time
    String bgImage = data['isDayTime'] ? 'day(new).png' : 'night(new).png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {      //Overriding the fetched(new) data with the old one
                    data = {
                      'time' : result['time'],
                      'location' : result['location'],
                      'isDayTime' : result['isDayTime'],
                      'flag' : result['flag']
                    };
                    print(data);
                  });
                },
                label: Text(
                    'Edit Location',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: Icon(
                    Icons.edit_location,
                  color: Colors.grey[300],
                ),
              ),
        
              SizedBox(height: 20.0),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
        
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 64.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
