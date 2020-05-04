import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initWorldTime() async {
    WorldTime wTime = WorldTime('Africa/Cairo', 'Cairo', 'egypt.png');
    await wTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wTime.location,
      'flag': wTime.flag,
      'locationUrl': wTime.locationUrl,
      'time': wTime.time,
      'isDayTime': wTime.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    initWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[600],
      body: Center(
        child: SpinKitPouringHourglass(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
