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
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.blueGrey[700],
        padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
        child: Column(children: [
          FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: Icon(
              Icons.edit_location,
              color: Colors.white,
            ),
            label: Text(
              'CHANGE LOCATION',
              style: TextStyle(color: Colors.white),
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
                      fontSize: 28, letterSpacing: 2, color: Colors.white))
            ],
          ),
          SizedBox(height: 30.0),
          Text(
            data['time'],
            style: TextStyle(fontSize: 66.0, color: Colors.white),
          )
        ]),
      ),
    ));
  }
}
