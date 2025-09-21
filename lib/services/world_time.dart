import 'package:http/http.dart';  //To fetch API endpoints
import 'dart:convert';    //To convert the fetched data
import 'package:intl/intl.dart';  //To change the date-time format

class WorldTime{
  String location;  //Location name for the UI
  String time;  //Time of the location
  String flag;  //Url to an asset flag icon
  String url;   //Url to the actual location

  WorldTime({required this.location, required this.time, required this.flag, required this.url});

 Future<void> getTime() async{

   try{
     //Making the request to get data
     Response response = await get(Uri.parse("https://timeapi.io/api/time/current/zone?timeZone=$url"));  //Asia%2FKolkata
     Map data = jsonDecode(response.body);

     //Saving the time-data in a more readable format
     String datetime = data['dateTime'];
     String timeZone = data['timeZone'];
     //Printing the time-api data

     //print(data);
     //print('$datetime - $timeZone');

     //Create a Datetime Object
     DateTime now = DateTime.parse(datetime);  //A much neater dateTime format
     now = now.add(Duration(hours: 0)); //No affect
     time = DateFormat.jm().format(now);  //Setting the time property in a readable format
   }
   catch(e)
   {
     print("Caught error:$e");  //Print the Error in the console
     time = "Error: Could not fetch Time Data";   //Passing the error over the UI
   }
}

}
