import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    //simulate a network request for a username
    String name = await Future.delayed(Duration(seconds: 3), () {
      return 'Joe';
    });
    //simulate a network request for the bio of username
    String bio = await Future.delayed(Duration(seconds: 3), () {
      return 'Egg collecter.';
    });
    print('$name - $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('hey');
  }

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
