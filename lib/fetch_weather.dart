import "dart:async";
import "dart:core";
import "package:http/http.dart" as http;
import "dart:convert";
import "package:weatherapp/save_weather.dart";

void getWeather(String location) async {
  try {
    //
    final url = Uri.parse(
        'https://yahoo-weather5.p.rapidapi.com/weather?location=$location&format=json&u=f');

    Map<String, String> headers = {
      "X-RapidAPI-Key": "6fefec31a2msh37e747a16d3a8c7p1dc2c4jsnc95aa4fbb2e1",
      "X-RapidAPI-Host": "yahoo-weather5.p.rapidapi.com"
    };

    var res = await http.get(
      url,
      headers: headers,
    );
    //
    if (res.statusCode != 200) {
      //
      throw AsyncError(
          "Could not get the weather of $location. Try again later", null);
    }

    Map weatherMap = json.decode(res.body);
    saveweather(weatherMap);

    print(
        "The weather in ${location.toUpperCase()} currently is ${weatherMap["current_observation"]["condition"]['text']} at ${weatherMap["current_observation"]["condition"]['temperature']}");

    print("///");
  } catch (err) {
    print(err);
  }
}
