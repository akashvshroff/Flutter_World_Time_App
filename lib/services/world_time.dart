import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  String time; //time that is displayed for the location
  String flag; //url path for the asset flag icon
  String url; //location url for API endpoint
  bool isDaytime; //true or false depending on whether it is day

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      String sign = offset.substring(0, 1);
      offset = offset.substring(1);
      List<String> comps = offset.split(':');
      int hour = int.parse(comps[0]);
      int minute = int.parse(comps[1]);

      //create a datetime object
      DateTime cur = DateTime.parse(datetime);
      cur = (sign == '+')
          ? cur.add(Duration(hours: hour, minutes: minute))
          : cur.subtract(Duration(hours: hour, minutes: minute));

      isDaytime = cur.hour >= 6 && cur.hour < 18 ? true : false;
      time = DateFormat.jm().format(cur);
    } catch (e) {
      print('caught error $e');
      time = 'Could not get time data';
    }
  }
}
