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
    Color bgColor = data['isDaytime'] ? Colors.blue[100] : Colors.black;
    Color textColor = data['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(children: [
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                  'EDIT LOCATION',
                  style: TextStyle(color: Colors.grey[300]),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['location'].toUpperCase(),
                      style: TextStyle(
                          fontSize: 28, letterSpacing: 2, color: textColor))
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: textColor,
                ),
              )
            ]),
          ),
        ));
  }
}
