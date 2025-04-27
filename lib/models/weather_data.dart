class WeatherData {
  final String cityName;
  final double temperature;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final int humidity;
  final int cloudiness;
  final double windSpeed;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.humidity,
    required this.cloudiness,
    required this.windSpeed,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      minTemp: json['main']['temp_min'].toDouble(),
      condition: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      cloudiness: json['clouds']['all'],
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}

class HourlyData {
  final int hour;
  final int temperature;
  final String icon;
  final String condition;


  HourlyData({
    required this.hour,
    required this.temperature,
    required this.icon,
     required this.condition,
  });
}