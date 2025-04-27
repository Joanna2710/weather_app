import 'package:day4_flutter/models/weather_data.dart';
import 'package:flutter/material.dart';


class HourlyForecast extends StatelessWidget {
  final List<HourlyData> hourlyForecast;

  const HourlyForecast({
    super.key,
    required this.hourlyForecast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: hourlyForecast.map((hourData) {
        return _buildHourlyForecast(
          hour: hourData.hour,
          temp: hourData.temperature,
          condition: hourData.condition, // Pass condition instead of icon
        );
      }).toList(),
    );
  }

  Widget _buildHourlyForecast({
    required int hour,
    required int temp,
    required String condition, // Changed from icon to condition
  }) {
    // Get appropriate icon based on condition
    IconData iconData;
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

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF0F2259),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            '$temp°C',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Icon(iconData, color: Colors.white, size: 30), // Use Icon instead of Image
          const SizedBox(height: 5),
          Text(
            '$hour:00',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}