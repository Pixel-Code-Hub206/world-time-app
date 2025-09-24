import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

 List<WorldTime> locations = [
   //Parameters to get time and flag data for the locations
   WorldTime(location: 'Kolkata', time: "", flag: 'india.png', url: 'Asia%2FKolkata', isDayTime: true),
   WorldTime(location: 'London', time: "", flag: 'uk.png', url: 'Europe%2FLondon', isDayTime: true),
   WorldTime(location: 'New York', time: "", flag: 'usa.png', url: 'America%2FNew_York', isDayTime: true),
   WorldTime(location: 'Los Angeles', time: "", flag: 'usa.png', url: 'America%2FLos_Angeles', isDayTime: true),
   WorldTime(location: 'Toronto', time: "", flag: 'canada.png', url: 'America%2FToronto', isDayTime: true),
   WorldTime(location: 'Vancouver', time: "", flag: 'canada.png', url: 'America%2FVancouver', isDayTime: true),
   WorldTime(location: 'Berlin', time: "", flag: 'germany.png', url: 'Europe%2FBerlin', isDayTime: true),
   WorldTime(location: 'Paris', time: "", flag: 'france.png', url: 'Europe%2FParis', isDayTime: true),
   WorldTime(location: 'Madrid', time: "", flag: 'spain.png', url: 'Europe%2FMadrid', isDayTime: true),
   WorldTime(location: 'Rome', time: "", flag: 'italy.png', url: 'Europe%2FRome', isDayTime: true),
   WorldTime(location: 'Zurich', time: "", flag: 'switzerland.png', url: 'Europe%2FZurich', isDayTime: true),
   WorldTime(location: 'Helsinki', time: "", flag: 'finland.png', url: 'Europe%2FHelsinki', isDayTime: true),
   WorldTime(location: 'Moscow', time: "", flag: 'russia.png', url: 'Europe%2FMoscow', isDayTime: true),
   WorldTime(location: 'Tokyo', time: "", flag: 'japan.png', url: 'Asia%2FTokyo', isDayTime: true),
   WorldTime(location: 'Seoul', time: "", flag: 'southkorea.png', url: 'Asia%2FSeoul', isDayTime: true),
   WorldTime(location: 'Singapore', time: "", flag: 'singapore.png', url: 'Asia%2FSingapore', isDayTime: true),
   WorldTime(location: 'Dubai', time: "", flag: 'uae.png', url: 'Asia%2FDubai', isDayTime: true),
   WorldTime(location: 'Sydney', time: "", flag: 'australia.png', url: 'Australia%2FSydney', isDayTime: true),
   WorldTime(location: 'Mexico City', time: "", flag: 'mexico.png', url: 'America%2FMexico_City', isDayTime: true),
   WorldTime(location: 'São Paulo', time: "", flag: 'brazil.png', url: 'America%2FSao_Paulo', isDayTime: true),
   WorldTime(location: 'Cape Town', time: "", flag: 'southafrica.png', url: 'Africa%2FJohannesburg', isDayTime: true),
   WorldTime(location: 'Cairo', time: "", flag: 'egypt.png', url: 'Africa%2FCairo', isDayTime: true),
   WorldTime(location: 'Istanbul', time: "", flag: 'turkey.png', url: 'Europe%2FIstanbul', isDayTime: true),
   WorldTime(location: 'Bangkok', time: "", flag: 'thailand.png', url: 'Asia%2FBangkok', isDayTime: true),
   WorldTime(location: 'Stockholm', time: "", flag: 'sweden.png', url: 'Europe%2FStockholm', isDayTime: true),
   WorldTime(location: 'Amsterdam', time: "", flag: 'netherlands.png', url: 'Europe%2FAmsterdam', isDayTime: true),
   WorldTime(location: 'Beijing', time: "", flag: 'china.png', url: 'Asia%2FShanghai', isDayTime: true),
   WorldTime(location: 'Wellington', time: "", flag: 'newzealand.png', url: 'Pacific%2FAuckland', isDayTime: true),
   WorldTime(location: 'Nairobi', time: "", flag: 'kenya.png', url: 'Africa%2FNairobi', isDayTime: true),
   WorldTime(location: 'Chicago', time: "", flag: 'usa.png', url: 'America%2FChicago', isDayTime: true),
   WorldTime(location: 'Jakarta', time: "", flag: 'indonesia.png', url: 'Asia%2FJakarta', isDayTime: true),
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
