import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(
        url: 'Africa/Johannesburg',
        location: 'Johanessburg',
        flag: 'south_africa.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'honk_kong.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Bangalore', flag: 'india.png'),
    WorldTime(url: 'America/Denver', location: 'Calgary', flag: 'canada.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
