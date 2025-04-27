import 'dart:convert';
import 'package:day4_flutter/models/weather_data.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '979e237b0f5e09e3c71616ac4781af58';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherData> getWeatherData(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }

  List<HourlyData> generateMockHourlyForecast(WeatherData weatherData) {
    final currentTemp = weatherData.temperature;
    final currentHour = DateTime.now().hour;
    
    List<HourlyData> hourlyForecast = [];
    
    for (int i = 0; i < 4; i++) {
      final hour = (currentHour + i) % 24;
      final temp = (currentTemp + (i - 1.5)).round();
      
      hourlyForecast.add(HourlyData(
        hour: hour,
        temperature: temp,
        condition: weatherData.condition, // Pass condition instead of icon path
        icon: 'default_icon_path', // Replace with the actual icon path or logic
      ));
    }
    
    return hourlyForecast;
  }
}