import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    /////////////////////////////////////////////////////////////////
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    /////////////////////////////////////////////////////////////////
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue[400] : Colors.blue[900];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'flag': result['flag'],
                          'locationUrl': result['locationUrl'],
                          'time': result['time'],
                          'isDayTime': result['isDayTime']
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[200],
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 28.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(fontSize: 60.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
