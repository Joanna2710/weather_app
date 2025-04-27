import 'package:day4_flutter/models/weather_data.dart';
import 'package:flutter/material.dart';
// import 'package:day4_flutter/utils/weather_icons.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherData weatherData;

  const CurrentWeather({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Replace Image.asset with Icon widget
        _getWeatherIcon(weatherData.condition),
        const SizedBox(height: 10),
        Text(
          '${weatherData.temperature.round()}°',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          weatherData.condition,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Max: ${weatherData.maxTemp.round()}° Min: ${weatherData.minTemp.round()}°',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
  
  // Helper method to return appropriate icon
  Widget _getWeatherIcon(String condition) {
    IconData iconData;
    double size = 100;
    Color color = Colors.white;
    
    switch (condition.toLowerCase()) {
      case 'clear':
        iconData = Icons.wb_sunny;
        break;
      case 'clouds':
        iconData = Icons.cloud;
        break;
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        iconData = Icons.grain;
        break;
      case 'thunderstorm':
        iconData = Icons.flash_on;
        break;
      case 'snow':
        iconData = Icons.ac_unit;
        break;
      default:
        iconData = Icons.cloud;
    }
    
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}