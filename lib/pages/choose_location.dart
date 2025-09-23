import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

 List<WorldTime> locations = [
   WorldTime(location: 'Kolkata', time: "", flag: 'india.png', url: 'Asia%2FKolkata', isDayTime: true),    //Parameters to get time and flag data for the locations
   WorldTime(location: 'London', time: "", flag: 'uk.png', url: 'Europe%2FLondon', isDayTime: true),    //Parameters to get time and flag data for the locations
   WorldTime(location: 'Athens', time: "", flag: 'greece.png', url: 'Europe%2FBerlin', isDayTime: true),    //Parameters to get time and flag data for the locations
   WorldTime(location: 'Cairo', time: "", flag: 'egypt.png', url: 'Africa%2FCairo', isDayTime: true),    //Parameters to get time and flag data for the locations
   WorldTime(location: 'Nairobi', time: "", flag: 'kenya.png', url: 'Africa%2FNairobi', isDayTime: true),    //Parameters to get time and flag data for the locations
   WorldTime(location: 'Chicago', time: "", flag: 'usa.png', url: 'America%2FChicago', isDayTime: true),    //Parameters to get time and flag data for the locations
   WorldTime(location: 'New York', time: "", flag: 'usa.png', url: 'America%2FNew_York', isDayTime: true),    //Parameters to get time and flag data for the locations
   WorldTime(location: 'South Korea', time: "", flag: 'south_korea.png', url: 'Asia%2FSeoul', isDayTime: true),    //Parameters to get time and flag data for the locations
   WorldTime(location: 'Jakarta', time: "", flag: 'indonesia.png', url: 'Asia%2FJakarta', isDayTime: true),    //Parameters to get time and flag data for the locations
  ];

 void updateTime(index) async{
   WorldTime instance = locations[index];   //The user selected data to be fetched stored in a local variable;
   await instance.getTime();    //Getting the actual time for the locally stored data

   Navigator.pop(context, {   //Bringing the fetched info to the home screen
         'location' : instance.location,
         'time' : instance.time,
         'flag' : instance.flag,
         'isDayTime' : instance.isDayTime,
       });
 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(
            'Choose a Location',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
      ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location), //The text for the actual location over the UI
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'), //Fetching Flags according the index of the selected Location option
                ),
                ),
            ),
          );
        },
      ),
    );
  }
}
