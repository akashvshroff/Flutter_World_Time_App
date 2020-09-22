import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
        child: Column(children: [
          FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: Icon(
              Icons.edit_location,
            ),
            label: Text(
              'EDIT LOCATION',
              style: TextStyle(),
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data['location'].toUpperCase(),
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                  ))
            ],
          ),
          SizedBox(height: 30.0),
          Text(
            data['time'],
            style: TextStyle(
              fontSize: 66.0,
            ),
          )
        ]),
      ),
    ));
  }
}
