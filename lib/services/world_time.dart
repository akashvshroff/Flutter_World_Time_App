import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  String time; //time that is displayed for the location
  String flag; //url path for the asset flag icon
  String url; //location url for API endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];

      //create a datetime object
      DateTime now = DateTime.parse(datetime);

      time = DateFormat.jm().format(now.toLocal());
    } catch (e) {
      print('caught error $e');
      time = 'could not get time data';
    }
  }
}
