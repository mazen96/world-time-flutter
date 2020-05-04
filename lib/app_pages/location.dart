import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime('Europe/London', 'London', 'uk.png'),
    WorldTime('Europe/Berlin', 'Athens', 'greece.png'),
    WorldTime('Africa/Cairo', 'Cairo', 'egypt.png'),
    WorldTime('Africa/Nairobi', 'Nairobi', 'kenya.png'),
    WorldTime('America/Chicago', 'Chicago', 'usa.png'),
    WorldTime('America/New_York', 'New York', 'usa.png'),
    WorldTime('Asia/Seoul', 'Seoul', 'south_korea.png'),
    WorldTime('Asia/Jakarta', 'Jakarta', 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime wTime = locations[index];
    await wTime.getTime();
    Navigator.pop(context, {
      'location': wTime.location,
      'flag': wTime.flag,
      'locationUrl': wTime.locationUrl,
      'time': wTime.time,
      'isDayTime': wTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0.0,
        title: Text('Choose location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
