import 'package:weather_app/model.dart';

class ListModel {
  ListModel({
     required this.consolidatedWeather,
  });

  List<Model> consolidatedWeather;

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
    consolidatedWeather: List<Model>.from(json["consolidated_weather"].map((x) => Model.fromJson(x))).toList(),
  );

  Map<String, dynamic> toJson() => {
    "consolidated_weather": List<dynamic>.from(consolidatedWeather.map((x) => x.toJson())),
  };
}
