import 'dart:io';
import 'package:weatherapp/fetch_weather.dart' as fetchweather;

void main(List<String> arguments) {
  String? location;

  if (arguments.isEmpty) {
    //
    print("Welcome to your command line weather app.");
    print("Enter your location");
    location = stdin.readLineSync();
    while (location == '' || location == null) {
      print("Enter your location");
      location = stdin.readLineSync();
    }
  } else {
    //
    location = arguments[0].split('=')[0];
  }

  fetchweather.getWeather(location);
}
