import 'package:flutter/material.dart';
import 'package:flutter_ani/models/weather_model.dart';
import 'package:flutter_ani/services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _weatherService = WeatherService('cb9a29c8744d7878e0c0879e4602e1fa');
  WeatherModel? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      print('🍓🍓🍓 weather: $weather');
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _weather == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _weather!.cityName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_weather!.temperature}°C',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    _weather!.mainCondition,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
