import 'package:day4_flutter/screens/weather_screen.dart';
import 'package:day4_flutter/widgets/app_logo.dart';
import 'package:day4_flutter/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  void _onSearchPressed() {
    if (_searchController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherScreen(
            city: _searchController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // title: const Text(
        //   'Select Location',
        //   style: TextStyle(color: Colors.grey, fontSize: 16),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const AppLogo(),
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/Sun cloud angled rain.png',
              height: 160,
              width: 160,
            ),
            const SizedBox(height: 60),
            CustomSearchBar(
              controller: _searchController,
              onSearchPressed: _onSearchPressed,
            ),
          ],
        ),
      ),
    );
  }
}