import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {

  String location; // location name for ui
  late String time; // time in that location
  String flag;  // url to an asset flag icon
  String url;  // location url for api  endpoints

  WorldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {
    http.Response response = await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data
    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1, 3);

    // print(datetime);
    // print(offset);

    //   create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set the time property
    time = now.toString();

  }

}