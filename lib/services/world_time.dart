import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String _location;
  String _time;
  String _flag;
  String _locationUrl;
  bool _isDayTime = true;

  WorldTime(this._locationUrl, this._location, this._flag);

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$_locationUrl');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offsetOperation = data['utc_offset'][0];
      int offset = int.parse(data['utc_offset'].substring(1, 3));

      DateTime now = DateTime.parse(datetime);

      now = offsetOperation == '+'
          ? now.add(Duration(hours: offset))
          : now.subtract(Duration(hours: offset));
      //now = now.add(Duration(hours: offset));

      _time = DateFormat.jm().format(now);
      _isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
    } catch (e) {
      _time = 'cannot get time data';
    }
  }

  String get locationUrl => _locationUrl;

  set locationUrl(String value) {
    _locationUrl = value;
  }

  String get flag => _flag;

  set flag(String value) {
    _flag = value;
  }

  String get time => _time;

  set time(String value) {
    _time = value;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  bool get isDayTime => _isDayTime;

  set isDayTime(bool value) {
    _isDayTime = value;
  }
}
