import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{

  late String location;
  late String time;
  late String flag;
  late String url;
  late String date;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});
  
  
  Future<void> getDateTime() async {

    try{ //better call catch
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime']; 

      //Formatting time to make it understandable(, have a great day)
      String offset = data['utc_offset'];
      DateTime current = DateTime.parse(datetime);
      String sign=offset.substring(0,1);
      String offsetHours=offset.substring(1,3);
      String offsetMinutes=offset.substring(4,6);
      if(sign=='+') current = current.add(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));
      else if(sign=='-') current = current.subtract(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));
      time = DateFormat.jm().format(current);
      
      //Gotta format date too i guess
      date = DateFormat.yMMMMEEEEd().format(current);
      print(date);


      //day time or not lol
      isDayTime = current.hour > 6 && current.hour < 20 ? true : false;

      
    }

    catch(e){
      print('BRUH! error: $e');
      time='Can\'t access data.';
      date='\0';
    }
  } 
}

