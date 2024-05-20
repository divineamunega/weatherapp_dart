import 'dart:convert';
import 'dart:io';

void saveweather(jsonString) async {
  final jsonStr = json.encode(jsonString);
  final file = await File('./weather.json').create();

  try {
    var former = await file.readAsString();
    List map = json.decode(former);
    map.add(jsonString);

    var newStr = json.encode(map);
    file.writeAsString(newStr);
  } catch (err) {
    file.writeAsString("[$jsonStr]");
    print(err);
  }

  print("File Written to ${file.path}");
}
