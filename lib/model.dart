class Model {
  Model({
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.applicableDate,
    required this.theTemp,
  });

  String weatherStateName;
  String weatherStateAbbr;
  DateTime applicableDate;
  double theTemp;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    weatherStateName: json["weather_state_name"],
    weatherStateAbbr: json["weather_state_abbr"],
    applicableDate: DateTime.parse(json["applicable_date"]),
    theTemp: json["the_temp"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "weather_state_name": weatherStateName,
    "weather_state_abbr": weatherStateAbbr,
    "applicable_date": "${applicableDate.year.toString().padLeft(4, '0')}-${applicableDate.month.toString().padLeft(2, '0')}-${applicableDate.day.toString().padLeft(2, '0')}",
    "the_temp": theTemp,
  };
}