import 'package:day4_flutter/models/weather_data.dart';
import 'package:day4_flutter/services/weather_service.dart';
import 'package:day4_flutter/widgets/current_weather.dart';
import 'package:day4_flutter/widgets/hourly_forecast.dart';
import 'package:day4_flutter/widgets/weather_info_item.dart';
import 'package:flutter/material.dart';


class WeatherScreen extends StatefulWidget {
  final String city;
  
  const WeatherScreen({super.key, required this.city});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  WeatherData? weatherData;
  List<HourlyData> hourlyForecast = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      final data = await _weatherService.getWeatherData(widget.city);
      setState(() {
        weatherData = data;
        hourlyForecast = _weatherService.generateMockHourlyForecast(data);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        // centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : errorMessage != null
              ? Center(
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            weatherData!.cityName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CurrentWeather(weatherData: weatherData!),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WeatherInfoItem(
                            value: '${weatherData!.humidity}%',
                            icon: Icons.water_drop_outlined,
                          ),
                          WeatherInfoItem(
                            value: '${weatherData!.cloudiness}%',
                            icon: Icons.cloud_outlined,
                          ),
                          WeatherInfoItem(
                            value: '${weatherData!.windSpeed} km/h',
                            icon: Icons.air_outlined,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Today',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      HourlyForecast(hourlyForecast: hourlyForecast),
                      const Spacer(),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0F2259),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('back'),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
    );
  }
}